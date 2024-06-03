import asyncio
from ib_insync import *
import numpy as np
from datetime import datetime, timedelta, time
import logging
import pandas as pd
import pandas_ta as ta
import pytz

# Set up basic configuration for logging
logging.basicConfig(
    level=logging.INFO,  # Log level
    format='%(asctime)s - %(levelname)s - %(message)s',  # Log message format
    filename='trading_log.log',  # File where logs will be written
    filemode='w'  # Open in append mode
)

# Constants
ORB_LENGTH = 30  # ORB length in minutes (variable)
CONSOLIDATION_TIME = 15  # Consolidation time in minutes
MAX_CLOSE_BELOW_VWAP = 5  # Maximum number of candle closes below VWAP
STOP_LOSS_PERCENTAGE = 0.003  # Stop loss percentage (0.3%)
LATEST_BUY_TIME = time(14, 0, tzinfo = pytz.timezone('US/Eastern')) # Latest time for initiating a buy order (2:00 PM)
# Initialize IB connection
ib = IB()
common_timezone = pytz.timezone('US/Eastern')



async def cancel_all_open_orders():
    logging.info("Cancelling all open orders...")
    for trade in ib.openTrades():
        ib.cancelOrder(trade.order)
    logging.info("All open orders cancelled.")

# Function to make datetime objects timezone aware
def make_offset_aware(dt, timezone):
    if dt.tzinfo is None:
        return timezone.localize(dt)
    return dt.astimezone(timezone)

# --- Indicator Calculation Functions ---
async def calculate_sma_slope(contract, sample_size, days_ago, bar_size):
    try:
        if sample_size == 'H':
            current_bars = await ib.reqHistoricalDataAsync(
                contract, '', '5 D', '1 hour', 'TRADES', useRTH=True)
            df = pd.DataFrame(current_bars)
            df['date'] = pd.to_datetime(df['date'])
            df.set_index('date', inplace=True)
            df['sma'] = ta.sma(df['close'], length=10)
            slope = (df['sma'].iloc[-1] - df['sma'].iloc[-2])
            print(slope,"Is slope")
            logging.info(f"Calculated SMA slope for 10 hours using hourly bars: {slope}")
            return slope
        else:
            current_end_time = datetime.now().strftime('%Y%m%d %H:%M:%S')
            oops = int(1.25*days_ago)
            print(oops)
            current_bars = await ib.reqHistoricalDataAsync(
                contract, current_end_time, f"{oops} {sample_size}", bar_size, 'TRADES', useRTH=True)
            df = pd.DataFrame(current_bars)
            # print(df)
            df['date'] = pd.to_datetime(df['date'])
            df.set_index('date', inplace=True)
            print(days_ago)
            df['sma'] = ta.sma(df['close'], length=days_ago)
            # print(df)
            slope = (df['sma'].iloc[-1] - df['sma'].iloc[-2])
            print(slope,"Is slope")
            # slope = (current_sma - past_sma) / days_ago
            logging.info(f"Calculated SMA slope for {days_ago} {sample_size} using {bar_size} bars: {slope}")
            return slope
    except Exception as e:
        logging.error(f"Error in calculating SMA slope: {e}")
        return None

async def check_sma_slopes(contract):
    try:
        periods = {
            '200 D': ('D', 200, '1 day'),
            '100 D': ('D', 100, '1 day'),
            '20 D': ('D', 20, '1 day'),
            '10 H': ('H', 10, '1 hour')
        }
        slopes = {}
        for period, (sample_size, days_ago, bar_size) in periods.items():
            slope = await calculate_sma_slope(contract, sample_size, days_ago, bar_size)
            if slope is None:
                logging.warning(f"SMA slope for {period} is not available.")
                return False
            slopes[period] = slope
        result = any(s > 0 for s in slopes.values())
        logging.info(f"All SMA slopes are positive: {result}")
        return result
    except Exception as e:
        logging.error(f"Error in check_sma_slopes: {e}")
        return False

async def find_highest_high(df, start_time="9:30", minutes_after_start=30):
    """Finds the highest high within the specified ORB period."""
    start_dt = pd.to_datetime(df['date'].min().date().strftime('%Y-%m-%d') + ' ' + start_time).tz_localize(common_timezone)
    end_dt = start_dt + timedelta(minutes=minutes_after_start)
    highest_high = df[(df['date'] >= start_dt) & (df['date'] < end_dt)]['high'].max()
    logging.info(f"Highest high during ORB ({start_time} - {end_dt.strftime('%H:%M')}): {highest_high}")
    return highest_high

async def calculate_vwap(df):
    """Calculates the VWAP for the given DataFrame."""
    q = df['volume']
    p = df['close']
    vwap = (p * q).cumsum() / q.cumsum()
    return vwap

# --- Strategy Logic Functions ---
async def find_maxima(df, orb_high, lookback_minutes=5, forward_minutes=15):
    """Finds price maxima that are higher than the ORB high."""
    maxima = []
    for i in range(lookback_minutes, len(df) - forward_minutes):
        current_price = df['high'][i]
        if (
            current_price > orb_high
            and current_price == df['high'][i - lookback_minutes:i + 1].max()
            and current_price > df['high'][i + 1:i + 1 + forward_minutes].max()
        ):
            maxima.append((df['date'][i], current_price))
    return maxima


async def check_consolidation(df, max_price_time, max_vwap_closes=5):
    """Checks for consolidation after a maximum."""
    consolidation_start = max_price_time + timedelta(minutes=15)
    consolidation_end = consolidation_start + timedelta(minutes=15)
    df_consolidation = df[
        (df['date'] >= consolidation_start) & (df['date'] <= consolidation_end)
    ]

    # Count closes below VWAP during consolidation
    closes_below_vwap = (df_consolidation['close'] < df_consolidation['vwap']).sum()

    return closes_below_vwap <= max_vwap_closes


async def was_last_trade_profitable(contract) -> bool:
  """
  Checks if the last filled trade for a given contract was profitable.

  Args:
    ib: The connected IB instance.
    contract: The contract to check.

  Returns:
    True if the last trade was profitable, False otherwise. 
    Returns None if no filled trades are found.
  """

  # Request fills from IB
  fills = ib.fills()
  print(fills)
  await asyncio.sleep(1)

  # Find the last filled trade for the given contract
  last_trade = None
  for fill in fills:
    if fill.contract == contract and fill.execution.permId != 0:  # Ensure it's a real trade
      last_trade = fill
      break

  if last_trade is None:
    print(f"No filled trades found for contract: {contract.symbol}")
    return None 

  # Calculate profitability based on side
  if last_trade.execution.side == "BOT":
      return last_trade.execution.avgPrice <= last_trade.contract.marketPrice()
  elif last_trade.execution.side == "SLD":
      return last_trade.execution.avgPrice >= last_trade.contract.marketPrice()
  else:
      print("Invalid trade side encountered.")
      return None


async def get_updated_data(contract):
    """Fetches updated 1-minute data for the given contract."""
    bars = await ib.reqHistoricalDataAsync(
        contract,
        durationStr='1 D',
        barSizeSetting='1 min',
        whatToShow='TRADES',
        useRTH=True,
        endDateTime= ''#start_time + timedelta(minutes=1)
    )
    df = pd.DataFrame(bars)
    df['date'] = pd.to_datetime(df['date']).dt.tz_convert(common_timezone)
    df['vwap'] = await calculate_vwap(df)
    return df

async def find_breakout_and_trade(contract, df, orb_high, quantity):
    position = 0
    first_trade_profitable = False
    low = None
    vwap_flag = 0
    cons_flag = 0
    print("ORB High inside function:", orb_high)
    prime = None
    while True:
        # await asyncio.sleep(60)
        maxima = await find_maxima(df, orb_high)
        maxima = maxima[-1][1]
        print("Maxima found:", maxima)
        if maxima:
            while vwap_flag < 5:
                df = await get_updated_data(contract)
                ltp = df['close'].iloc[-1]
                latest_vwap = df['vwap'].iloc[-1]
                print(f"LTP: {ltp}, VWAP: {latest_vwap}")
                if ltp > latest_vwap:
                    print(f"LTP is below VWAP. Present counter {vwap_flag}")
                    vwap_flag +=1
                    continue
                if ltp < maxima:
                    print(f"LTP is below maxima. Present counter {cons_flag}")
                    cons_flag +=1
                elif ltp > maxima:
                    cons_flag =0    
                if cons_flag > 15:
                    low = df['low'].rolling(window=15, min_periods=1).min()
                    print("Consolidation period over. Exiting.")
                    prime = True
                    break 
                print(vwap_flag,cons_flag)
            vwap_flag=0
            cons_flag=0    
        if prime:
            break

    while True:
        ib.reqMarketDataType(4)
        # Request market data for the contract
        ticker =  ib.reqMktData(contract, '', False, False)
        
        await asyncio.sleep(1)
        ltp = ticker.marketPrice()
        print(f"Last Traded Price: {ltp}") 
        if ltp < maxima and datetime.now(common_timezone).time() > time(14, 0):
            print("Buy triggered")
            await place_buy_order(contract, quantity=1)
            await place_stop_loss_order(contract, quantity, low)
            while True:
                ticker =  ib.reqMktData(contract, '', False, False)
                pltp = ticker.marketPrice()
                print(f"Last Traded Price: {pltp}") 
                if pltp < ltp*0.7 or check_bearish_crossover(contract):
                    await cancel_all_open_orders()
                    await close_position(contract)
                    result = await was_last_trade_profitable(contract)
                    return result
                await asyncio.sleep(1)    

async def manage_trades(contract, quantity):
    """Manages open positions and executes trading logic."""
    position = 0
    first_trade_profitable = False
    stop_loss_price = None  

    while True:
        current_time = make_offset_aware(datetime.now(), common_timezone).time()


        # if current_time < time(16, 0, tzinfo = common_timezone) or current_time > time(9, 30, tzinfo = common_timezone):
        #     logging.info("Market is closed... trading halted.")
        #     # Sleep for 1 hour before checking the market status again
        #     await asyncio.sleep(3600)
        #     continue

        # 1. Check SMA Conditions:
        if not await check_sma_slopes(contract):
            logging.info("SMA slopes are not positive. Sleeping for 60 seconds.")
            await asyncio.sleep(60)
            continue

        # 2. Fetch Market Data
        bars = await ib.reqHistoricalDataAsync(
            contract,
            endDateTime='',
            durationStr='1 D',
            barSizeSetting='1 min',
            whatToShow='TRADES',
            useRTH=True
        )
        df = pd.DataFrame(bars)
        df['date'] = pd.to_datetime(df['date']).dt.tz_convert(common_timezone)
        df['vwap'] = await calculate_vwap(df)

        # 3. Calculate ORB High:
        orb_high = await find_highest_high(df, start_time="9:30", minutes_after_start=ORB_LENGTH)

        if orb_high is not None:
            logging.info(f"ORB High: {orb_high}")

            # 4. Manage Entry and Exit
            #change this to <
            print("Current Time:", current_time)
            if current_time > LATEST_BUY_TIME:
                # Find breakout setups and enter trades if conditions are met
                first_trade_profitable = await find_breakout_and_trade(contract, df, orb_high, quantity)
                if first_trade_profitable:
                    logging.info("First trade was profitable. Exiting...")
                    break
                continue
            return
# Reset for the next day
                

        await asyncio.sleep(60)  # Sleep 1 minute

# --- Order Execution Functions ---
async def place_buy_order(contract, quantity):
    """Places a market buy order."""
    try:
        order = MarketOrder('BUY', quantity)
        trade = ib.placeOrder(contract, order)
        logging.info(f"Buy order placed: {trade}")
        return trade
    except Exception as e:
        logging.error(f"Error placing buy order: {e}")
        return None

async def place_stop_loss_order(contract, quantity, stop_price):
    """Places a stop loss order."""
    try:
        order = StopOrder('SELL', quantity, stop_price)
        trade = ib.placeOrder(contract, order)
        logging.info(f"Stop loss order placed: {trade}")
        return trade
    except Exception as e:
        logging.error(f"Error placing stop loss order: {e}")
        return None

async def check_bearish_crossover(contract):
    """Checks for a bearish EMA crossover on the 3-minute timeframe."""
    bars = await ib.reqHistoricalDataAsync(contract, '', '2 D', '3 mins', 'TRADES', useRTH=True)
    df = pd.DataFrame(bars)
    df['date'] = pd.to_datetime(df['date']).dt.tz_convert(common_timezone)
    df.set_index('date', inplace=True)
    df['ema_10'] = ta.sma(df['close'], length=10)
    df['ema_30'] = ta.sma(df['close'], length=30)

    return df['ema_10'].iloc[-1] < df['ema_30'].iloc[-1] 

async def close_position(contract):
    """Closes any open position in the given contract."""
    try:
        positions = ib.positions()
        for position in positions:
            if position.contract == contract and position.position != 0:
                order = MarketOrder('SELL', abs(position.position))
                trade = ib.placeOrder(contract, order)
                logging.info(f"Closed position: {trade}")
                return trade
        logging.info("No open position to close.")
        return None
    except Exception as e:
        logging.error(f"Error closing position: {e}")
        return None

async def main():
    """Connects to IB, qualifies the contract, and starts the trading loop."""
    await ib.connectAsync('3.14.248.152', 7497, clientId=1)
    # contract = Index(symbol='SPX', exchange='CBOE', currency='USD')
    contract = Stock(symbol='SPY', exchange='SMART', currency='USD')
    await ib.qualifyContractsAsync(contract)  # Make sure the contract is valid

    await manage_trades(contract, quantity=1)  # Adjust quantity as needed

if __name__ == '__main__':
    ib.run(main())