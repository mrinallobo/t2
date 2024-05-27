#region Using declarations
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using System.Windows.Media;
using System.Xml.Serialization;
using NinjaTrader.Cbi;
using NinjaTrader.Gui;
using NinjaTrader.Gui.Chart;
using NinjaTrader.Gui.SuperDom;
using NinjaTrader.Gui.Tools;
using NinjaTrader.Data;
using NinjaTrader.NinjaScript;
using NinjaTrader.Core.FloatingPoint;
using NinjaTrader.NinjaScript.Indicators;
using NinjaTrader.NinjaScript.DrawingTools;
using NinjaTrader.NinjaScript.MarketAnalyzerColumns;
using NinjaTrader.CQG.ProtoBuf;
using MySql.Data.MySqlClient;
using Shared1;
using System.Windows.Controls;

#endregion



//This namespace holds Strategies in this folder and is required. Do not change it. 
namespace NinjaTrader.NinjaScript.Strategies
{
	public class DiscordExecution304 : Strategy
	{
		static string db_name = "automatedtrading";
		static string db_pwd  = "";
		
        MySqlConnection conn = new MySqlConnection("server=127.0.0.1;user=root;database=" + db_name + ";password=" + db_pwd + ";");
        string symbol_like_sql = "";
        bool has_pending_order = false;
        string order_refrence = "";

        Dictionary<string, double> orderTpMap = new Dictionary<string, double>();
        Dictionary<string, double> orderSlMap = new Dictionary<string, double>();
        /*
        Dictionary<string, double> orderTp2Map = new Dictionary<string, double>();
        Dictionary<string, double> orderTp3Map = new Dictionary<string, double>();
        Dictionary<string, double> orderTp4Map = new Dictionary<string, double>();
        Dictionary<string, int> orderSize1Map = new Dictionary<string, int>();
        Dictionary<string, int> orderSize2Map = new Dictionary<string, int>();
        Dictionary<string, int> orderSize3Map = new Dictionary<string, int>();
        Dictionary<string, int> orderSize4Map = new Dictionary<string, int>();
        */
        Dictionary<string, double> orderTrMap = new Dictionary<string, double>();
        Dictionary<string, bool> exitOrderStatusMap = new Dictionary<string, bool>();
        Dictionary<string, string> monthsNTMap = new Dictionary<string, string>(){
            { "JAN", "01"}, { "FEB", "02"}, { "MAR", "03"},
            { "APR", "04"}, { "MAY", "05"}, { "JUN", "06"},
            { "JUL", "07"}, { "AUG", "08"}, { "SEP", "09"},
            { "OCT", "10"}, { "NOV", "11"}, { "DEC", "12"},
        };
        Dictionary<string, string> alertsStatus = new Dictionary<string, string>();
        Dictionary<string, string> entryExecutedTime = new Dictionary<string, string>();
        Dictionary<string, string> entryExecutedPrice = new Dictionary<string, string>();
        Dictionary<string, string> executedQuantity = new Dictionary<string, string>();
        Dictionary<string, string> marketPrice = new Dictionary<string, string>();
        Dictionary<string, string> exitExecutedTime = new Dictionary<string, string>();
        Dictionary<string, string> exitExecutedPrice = new Dictionary<string, string>();
        Dictionary<string, string> exitExecutedQuantity = new Dictionary<string, string>();



        /*
        Dictionary<string, string> tp1 = new Dictionary<string, string>();
        Dictionary<string, string> tp2 = new Dictionary<string, string>();
        Dictionary<string, string> tp3 = new Dictionary<string, string>();
        Dictionary<string, string> tp4 = new Dictionary<string, string>();
        Dictionary<string, string> size1 = new Dictionary<string, string>();
        Dictionary<string, string> size2 = new Dictionary<string, string>();
        Dictionary<string, string> size3 = new Dictionary<string, string>();
        Dictionary<string, string> size4 = new Dictionary<string, string>();
        */

        private bool watch_break_even;
        private string breakeven_order_name;
        private double breakeven_trigger;
        private double breakeven_distance;

        protected override void OnStateChange()
		{
			if (State == State.SetDefaults)
			{
                Description									= @"Tick based strategy that executes orders based on signals from CopitradeSQLAlerts";
				Name										= "DiscordExecution304";
				Calculate = Calculate.OnEachTick;
                EntriesPerDirection = 10000;
                EntryHandling = EntryHandling.AllEntries;
                IsExitOnSessionCloseStrategy = true;
                ExitOnSessionCloseSeconds = 30;
                IsFillLimitOnTouch = false;
                MaximumBarsLookBack = MaximumBarsLookBack.TwoHundredFiftySix;
                OrderFillResolution = OrderFillResolution.Standard;
                Slippage = 0;
                StartBehavior = StartBehavior.ImmediatelySubmit;
                TimeInForce = TimeInForce.Gtc; // Timeineforcetime
                TraceOrders = true;
                RealtimeErrorHandling = RealtimeErrorHandling.StopCancelClose;
                StopTargetHandling = StopTargetHandling.PerEntryExecution;
                BarsRequiredToTrade = 0;
				// Disable this property for performance gains in Strategy Analyzer optimizations
				// See the Help Guide for additional information
				IsInstantiatedOnEachOptimizationIteration = true;
				
				#region Default Settings

               	//Time Limits
				
				Start										= DateTime.Parse("18:01", System.Globalization.CultureInfo.InvariantCulture);
				Stop										= DateTime.Parse("16:45", System.Globalization.CultureInfo.InvariantCulture);

            	#endregion
                // InitialStop					= -30;
				// BreakevenDistance					= 30;
				// BreakevenTickOffset					= 0;
				// InitialStopShort					= 30;
				// BreakevenDistanceShort					= -30;
				// BreakevenTickOffsetShort					= 0;
				// Price					= 1;
				// BreakevenTargetPrice					= 1;
				// BreakEvenBool					= false;
                watch_break_even = false;
                breakeven_order_name = "";
                breakeven_trigger = 0;
                breakeven_distance = 8;

            }
			else if (State == State.DataLoaded)
			{
                symbol_like_sql = Instrument.FullName.Split(' ')[0];
            }
		}

		protected override void OnConnectionStatusUpdate(Cbi.ConnectionStatusEventArgs connectionStatusUpdate)
        {
            if (connectionStatusUpdate.Status == Cbi.ConnectionStatus.Connected)
            {
                Print("Connected to database");
            }
        }



        //        private void SetOrderParameters(string entry_tag, int direction, double sl_perc, double tp_perc, double tr_perc)
        //        {
        //            if (tr_perc > 0)
        //            {
        //                SetTrailStop(entry_tag, CalculationMode.Percent, tr_perc * direction, false);
        //                SetProfitTarget(entry_tag, CalculationMode.Percent, tp_perc * direction);
        //            }
        //            else
        //            {
        //                SetStopLoss(entry_tag, CalculationMode.Percent, sl_perc * direction, false);
        //                SetProfitTarget(entry_tag, CalculationMode.Percent, tp_perc * direction);
        //            }
        //        }

        //protected override void OnMarketData(MarketDataEventArgs marketDataUpdate);

        protected override void OnExecutionUpdate(Execution execution, string executionId, double price, int quantity, MarketPosition marketPosition, string orderId, DateTime time)
        {
            Cbi.Order order = execution.Order;
            OrderState orderState = order.OrderState;

            if (!order.Name.Contains('#')) return;

            if (!order.IsMarket)
            { // Order is either TP or SL
                if (Cbi.Order.IsTerminalState(orderState))
                {
                    // todo get exit price
                    // BREAKEVEN todo remove items from breakeven watch list
                }
                return;
            }

            if (Cbi.Order.IsTerminalState(orderState))
            {
                has_pending_order = false;

                string[] orderInfo = order.Name.Split('#');
                string id = orderInfo[1].ToString();
                order_refrence = orderInfo[0].ToString();
                Print(order_refrence);

                Print("The order state is: " + orderState + " at this time " + time.ToString("MM/dd/yyyy HH:mm:ss"));
                Print("The order action is: " + order.OrderAction + " at this time " + time.ToString("MM/dd/yyyy HH:mm:ss"));
                Print("The order quantity is: " + order.Quantity + " at this time " + time.ToString("MM/dd/yyyy HH:mm:ss"));
                Print("The order filled is: " + order.Filled + " at this time " + time.ToString("MM/dd/yyyy HH:mm:ss"));
                Print("The order average fill price is: " + order.AverageFillPrice + " at this time " + time.ToString("MM/dd/yyyy HH:mm:ss"));
                Print("The order name is: " + order.Name + " at this time " + time.ToString("MM/dd/yyyy HH:mm:ss"));
                Print("The order instrument is: " + order.Instrument + " at this time " + time.ToString("MM/dd/yyyy HH:mm:ss"));
                Print("The order is market: " + order.IsMarket + " at this time " + time.ToString("MM/dd/yyyy HH:mm:ss"));

                if (order.OrderState == OrderState.Filled && !exitOrderStatusMap[order.Name])
                {
                    // double tp_perc;
                    // double sl_perc;
                    // double tr_perc;

                    // orderTpMap.TryGetValue(id, out tp_perc);
                    // orderSlMap.TryGetValue(id, out sl_perc);
                    // orderTrMap.TryGetValue(id, out tr_perc);

                    // if (tr_perc > 0) { 
                    //     SetTrailStop(order.Name, CalculationMode.Percent, tr_perc, false);
                    //     SetProfitTarget(order.Name, CalculationMode.Percent, tp_perc);
                    // }
                    // else
                    // {
                    //     SetStopLoss(order.Name, CalculationMode.Percent, sl_perc, false);
                    //     SetProfitTarget(order.Name, CalculationMode.Percent, tp_perc);
                    // }

                    // Declare variables for take profit, stop loss, and trail amount                   
                    double tp_amount;
                    double sl_amount;
                    double tr_amount;

                    // Try to get the values from the dictionaries using the order name as the key
                    orderTpMap.TryGetValue(order.Name, out tp_amount);
                    orderSlMap.TryGetValue(order.Name, out sl_amount);
                    orderTrMap.TryGetValue(order.Name, out tr_amount);

                    // If trail amount is greater than 0, set trail stop and profit target
                    if (tr_amount > 0)
                    {
                        SetTrailStop(order.Name, CalculationMode.Ticks, tr_amount, false);
                    }
                    else
                    {
                        SetStopLoss(order.Name, CalculationMode.Ticks, sl_amount, false);

                        watch_break_even = true;
                        breakeven_order_name = order.Name;
                        if (Position.MarketPosition == MarketPosition.Long)
                        {
                            breakeven_trigger = order.AverageFillPrice + breakeven_distance * TickSize;
                        }
                        else if (Position.MarketPosition == MarketPosition.Short)
                        {
                            breakeven_trigger = order.AverageFillPrice - breakeven_distance * TickSize;
                        }
                    }
                    SetProfitTarget(order.Name, CalculationMode.Ticks, tp_amount);

                    exitOrderStatusMap[order.Name] = true;

                    string status;
                    if (order.OrderAction == OrderAction.Buy)
                    {
                        status = "Enter Long Filled";
                    }
                    else
                    {
                        status = "Enter Short Filled";
                    }
                    entryExecutedTime.Add(id, time.ToString("MM/dd/yyyy HH:mm:ss"));
                    entryExecutedPrice.Add(id, order.AverageFillPrice.ToString());
                    executedQuantity.Add(id, order.Filled.ToString());

                    // // Execution update for exit orders
                    // if (execution.Order != null && execution.Order.OrderAction == OrderAction.Sell) // && execution.Order.Name == "close")
                    // {
                                          
                    //     status = "Exit Long Filled";
                    // }
                    // else if (execution.Order != null && execution.Order.OrderAction == OrderAction.SellShort) // && execution.Order.Name == "close")
                    // {
                    //     status = "Exit Short Filled";
                    // }

                    // exitExecutedTime.Add(id, time.ToString("MM/dd/yyyy HH:mm:ss"));
                    // exitExecutedPrice.Add(id, order.AverageFillPrice.ToString());
                    // exitExecutedQuantity.Add(id, order.Filled.ToString());  

                    // // BREAKEVEN add fill price to a dictionary with key: order name



                    alertsStatus[id] = status;
                }
            }
            else
            {
                has_pending_order = true;
            }
        }

        protected void updateDB(string id, string status)
        {
            string sqlSignalsUpdate = "UPDATE `" + db_name + "`.`signals` SET `Status`='" + status; 
			
			if (entryExecutedTime.ContainsKey(id)) sqlSignalsUpdate += "', `ExecutedTime`='" + entryExecutedTime[id];
			if (entryExecutedPrice.ContainsKey(id)) sqlSignalsUpdate += "', `FillPrice`='" + entryExecutedPrice[id];
            if (executedQuantity.ContainsKey(id)) sqlSignalsUpdate += "', `ExecutedQuantity`='" + executedQuantity[id];
            if (marketPrice.ContainsKey(id)) sqlSignalsUpdate += "', `MarketPrice`='" + marketPrice[id];

            sqlSignalsUpdate += "' WHERE `id` =" + id + "";

            /*
            if (orderTp1Map.ContainsKey(id)) sqlSignalsUpdate += ", `TP1Price`='" + orderTp1Map[id];
            if (orderTp2Map.ContainsKey(id)) sqlSignalsUpdate += ", `TP2Price`='" + orderTp2Map[id];
            if (orderTp3Map.ContainsKey(id)) sqlSignalsUpdate += ", `TP3Price`='" + orderTp3Map[id];
            if (orderTp4Map.ContainsKey(id)) sqlSignalsUpdate += ", `TP4Price`='" + orderTp4Map[id];

            if (orderSize1Map.ContainsKey(id)) sqlSignalsUpdate += ", `Size1`='" + orderSize1Map[id];
            if (orderSize2Map.ContainsKey(id)) sqlSignalsUpdate += ", `Size2`='" + orderSize2Map[id];
            if (orderSize3Map.ContainsKey(id)) sqlSignalsUpdate += ", `Size3`='" + orderSize3Map[id];
            if (orderSize4Map.ContainsKey(id)) sqlSignalsUpdate += ", `Size4`='" + orderSize4Map[id];
            */
            
            MySqlCommand cmdUpdate = new MySqlCommand(sqlSignalsUpdate, conn);
            cmdUpdate.ExecuteReader();
        }

		/// <summary>
        /// Method called on each bar update.
        /// </summary>
        protected override void OnBarUpdate()
        {
            if (watch_break_even)
            {
                if (Position.MarketPosition == MarketPosition.Long && Close[0] >= breakeven_trigger)
                {
                    SetStopLoss(breakeven_order_name, CalculationMode.Price, Position.AveragePrice, false);
                    watch_break_even = false;
                }
                else if (Position.MarketPosition == MarketPosition.Short && Close[0] <= breakeven_trigger)
                {
                    SetStopLoss(breakeven_order_name, CalculationMode.Price, Position.AveragePrice, false);
                    watch_break_even = false;
                }
            }
            
            
            // Check if there are any pending orders if (IsFlat && myEntryOrder != null && myEntryOrder.OrderState == OrderState.Working) { 
            // Get the current time DateTime currentTime = Time[0];

            string status;
            //create a variable simiar to fill_price in OnOrderUpdate and assign it to AverageFillPrice for order
 
            MySqlDataReader rdr = null;

            try
            {
                // BREAKEVEN create a loop to check if need to adjust stop loss to breakeven
                conn.Open();
                // update DB with status
                if (alertsStatus.Count > 0)
                {
                    // update DB
                    foreach (var item in alertsStatus)
                    {
                        updateDB(item.Key, item.Value);
                    }
                    conn.Close();
                    conn.Open();

                    // clear values in alertsStatus
                    alertsStatus.Clear();
                }

                // string sqlSignals = @"
                // SELECT signals.id, signals.Instrument, userprovider.Provider_id, userprovider.Channel_id
                // FROM signals 
                // INNER JOIN userprovider
                //     ON signals.Provider_id = userprovider.Provider_id 
                //     AND signals.Channel_id = userprovider.Channel_id 
                //     AND signals.AssetType = userprovider.AssetType 
                //     AND signals.InstrumentType = userprovider.InstrumentType
                // WHERE signals.AssetType = 'Futures'
                //     AND userprovider.CopyTrade = 1 
                //     AND signals.Status = 'pending'
                // ORDER BY signals.id DESC
                // LIMIT 0,1";
                string sqlSignals = @"
                SELECT * 
                FROM signals 
                INNER JOIN userprovider
                    ON signals.Provider_id = userprovider.Provider_id 
                    AND signals.Channel_id = userprovider.Channel_id 
                    AND signals.AssetType = userprovider.AssetType 
                    AND signals.InstrumentType = userprovider.InstrumentType
                WHERE signals.AssetType = 'Futures' " +

                  @"AND signals.Instrument LIKE '" + symbol_like_sql + @"%' " +

                  @"AND userprovider.CopyTrade = 1 
                    AND signals.Status = 'pending'
                ORDER BY signals.id DESC
                LIMIT 0, 1";

               // Get the current time before executing the query
                DateTime startTime = DateTime.Now;
                Print("Executing query at: " + startTime.ToString("MM/dd/yyyy HH:mm:ss"));

                MySqlCommand cmd = new MySqlCommand(sqlSignals, conn);

                rdr = cmd.ExecuteReader();

                // Get the current time after executing the query
                DateTime endTime = DateTime.Now;

                // Calculate the duration and print it
                TimeSpan duration = endTime - startTime;
                Print("Query executed in: " + duration.TotalSeconds + " seconds");

                while (rdr.Read())
                {
                    string id = rdr["id"].ToString();
                    string ntSymbol = rdr["Instrument"].ToString();

                    // Grab the CreationTime from the signals record
                    DateTime creationTime = DateTime.Parse(rdr["CreationTime"].ToString());

                    // Get the current time
                    DateTime currentTime = DateTime.Now;

                    // Calculate the difference in minutes
                    double minutesDifference = (currentTime - creationTime).TotalMinutes;

                    // Check if the difference is more than 2 minutes
                    if (minutesDifference > 2)
                    {
                        // Skip alert. Time
                        status = "expired - time";
                        alertsStatus.Add(id, status);
                        return;
                    }

                    // Check if ntSymbol is the symbol on the chart
                    if (ntSymbol != Instrument.FullName)
                    {
                        if (alertsStatus.ContainsKey(id))
                        {
                            return;
                        }
                        // Skip alert. Not supported
                        status = "skipped - Not supported";
                        alertsStatus.Add(id, status);
                        return;
                    }

                    string providerId = rdr["Provider_id"].ToString(); 
                    string channelId = rdr["Channel_id"].ToString();
                    //string providerName = rdr["ProviderName"].ToString(); 
                    //string channelName = rdr["ChannelName"].ToString();
                    DateTime currentBarTime = Time[0];

                    // check if time is within range of market closed hours 
                    if (currentBarTime.TimeOfDay >= Start.TimeOfDay && currentBarTime.TimeOfDay < Stop.TimeOfDay)
                    {
                        // Skip alert. Time
                        status = "skipped - market closed";
                        alertsStatus.Add(id, status);
                        return;

                    }

//                    // if time is within range then cancel all pending orders
//                    if (currentTime.TimeOfDay >= Start.TimeOfDay && currentTime.TimeOfDay < Stop.TimeOfDay)                    {
//                        foreach (var item in orderStatusMap)
//                        {
//                            if (item.Value)
//                            {
//                                CancelOrder(item.Key);
//                            }
//                        }
//                    }
                     

                    // added a condition to check if the userprovider.CopyTrade is not equal to 1
                    if (rdr["CopyTrade"].ToString() != "1")
	                {
	                    // Skip alert. Unauthorized provider
	                    status = "skipped - Unauthorized provider";
	                    alertsStatus.Add(id, status);
	                    return;
	                }

                    // Add the current market price for the given symbol to the marketPrice dictionary
                    marketPrice.Add(id, Close[0].ToString());


                    // Print the current position for the given symbol
                    Print(Position);

                    // If the current position is long and the action is to buy, skip this iteration
					if (Position.MarketPosition == MarketPosition.Long & rdr["Action"].ToString() == "1")
					{
						status = "skipped - long position exists";
	                    alertsStatus.Add(id, status);
						return;
					}

                    // If the current position is flat, the action is to sell, and the side is to close, skip this iteration
                    if (Position.MarketPosition == MarketPosition.Flat & rdr["Action"].ToString() == "-1" & rdr["Side"].ToString() == "close") // STC but short position does not exist
                    {
                        status = "skipped - no long position to close"; 
						alertsStatus.Add(id, status);
						return;
					}

                    // If the current position is short and the action is to sell, skip this iteration
                    if (Position.MarketPosition == MarketPosition.Short & rdr["Action"].ToString() == "-1")					
					{
						status = "skipped - short position exists";
                        alertsStatus.Add(id, status);
						return;
					}

                    // If the current position is flat, the action is to buy, and the side is to close, skip this iteration
                    if (Position.MarketPosition == MarketPosition.Flat & rdr["Action"].ToString() == "1" & rdr["Side"].ToString() == "close") // BTC but no short position exist
                    {
                        status = "skipped - no short position to close"; 
						alertsStatus.Add(id, status);
						return;
					}
					
                    // If the current position is not flat and the side is to open, skip this iteration
					if (Position.MarketPosition != MarketPosition.Flat & rdr["Side"].ToString() == "open")
					{
						status = "skipped - position is not flat";
						alertsStatus.Add(id, status);
				        return;
	                }

                    // If there is a pending order for the given symbol, skip this iteration
                    if (has_pending_order)
                    {
                        status = "skipped - pending order";
                        alertsStatus.Add(id, status);
                        return;
                    }
					// Time expiration for orders tbd
                    // Offset check 
					// will need to account for NQs
                    double price = Double.Parse(rdr["Price"].ToString());  //1000
                    // double entryOffset = Double.Parse(rdr["EntryOffsetAmount"].ToString());  // entryoffset = 0.25
                    // double max_price = price + entryOffset; // 1000.25
                    // double min_price = price - entryOffset; // 999.75

                    // % based
                    double close_price = Close[0];
                    Print("Close price: " + close_price);
                    
                    double entryOffset = Double.Parse(rdr["EntryOffsetAmount"].ToString());  // entryoffset = 3
                    double max_price = price + entryOffset; // 1000.25
                    double min_price = price - entryOffset-1; // 999.75
                    // double entryOffset = Double.Parse(rdr["EntryOffsetPercent"].ToString()); 

                    // double max_price = price * (1 + entryOffset / 100);
                    // double min_price = price * (1 - entryOffset / 100);

                    // check if price is in the offset range equal or less than 1 tick  // Currently market order
					//this way offset check will be only done for action 1  
					if ((close_price <= min_price || close_price >= max_price) & rdr["Side"].ToString() == "open")
					{
                        status = "skipped - price out of range";
                        alertsStatus.Add(id, status);
                        return;
                    }

                    double positionAmount = Double.Parse(rdr["positionAmount"].ToString());
                    int quantity = (int)(positionAmount / close_price);

                    if (quantity <= 0)
                    {
                        status = "skipped - invalid quantity";
                        alertsStatus.Add(id, status);
                        return;
                    }

                    // check if action is valid
                    int action = Int32.Parse(rdr["Action"].ToString());
                    if (action != 1 && action != -1)
                    {
                        status = "skipped - invalid action";
                        alertsStatus.Add(id, status);
                        return;
                    }

                    // check if side is valid
                    string side = rdr["Side"].ToString();
                    if (side != "open" && side != "close")
                    {
                        status = "skipped - invalid side";
                        alertsStatus.Add(id, status);
                        return;
                    }

                    // execute order
                    string entry_tag = providerId + "_" + channelId + "#" + rdr["id"].ToString();
                    Print("Entry tag: " + entry_tag);

                    // double trail_perc = Double.Parse(rdr["TrailPercent"].ToString()) / 100;
                    // double sl_perc = Double.Parse(rdr["StopLossPercent"].ToString()) / 100;
                    // double tp_perc = Double.Parse(rdr["TP1Percent"].ToString()) / 100;
                    
                    

                    double trail_amount = Double.Parse(rdr["TrailAmount"].ToString());
                    double sl_amount = Double.Parse(rdr["StopLossAmount"].ToString());
                    double tp_amount = Double.Parse(rdr["TP1Amount"].ToString());

                    // close order only if it corresponds to the position opened by provider and channel ids
                    if (rdr["Side"].ToString() == "close")
                    {
                        string id_to_exit = providerId + "_" + channelId;
                        Print("ID to exit: " + id_to_exit);

                        if (id_to_exit != order_refrence)
                        {
                            status = "skipped - Mismatched provider";
                            alertsStatus.Add(id, status);
                            return;
                        }
                    }

                    if (rdr["Action"].ToString() == "1")  
                    {
						if (rdr["Side"].ToString() == "close")
                        { // BTC
                            ExitShort();
							status = "Exit Short Placed";
							alertsStatus.Add(id, status);
							return;
						}
	                    
						EnterLong(quantity, entry_tag);
                        exitOrderStatusMap.Add(entry_tag, false);
                       
                        if (trail_amount > 0)
                        {
                            orderTrMap.Add(entry_tag, trail_amount);
                            orderTpMap.Add(entry_tag, tp_amount);
						}
						
                        else
                        {
                            orderSlMap.Add(entry_tag, sl_amount);
                            orderTpMap.Add(entry_tag, tp_amount);
                        }

                        //status = "EnterLong"; // Must only set status IF order is filled
                        
                        status = "Enter Long Placed";
                        alertsStatus.Add(id, status);
                        return;
                    }
                    else  // action == -1 // Must not place short order if the original order was not filled 
                    {
						if (rdr["Side"].ToString() == "close")
						{
							ExitLong();
						    status = "Exit Long Placed";
							alertsStatus.Add(id, status);
							return;
						}
						EnterShort(quantity, entry_tag);
                        exitOrderStatusMap.Add(entry_tag, false);

                        if (trail_amount > 0)
                        {
                            orderTrMap.Add(entry_tag, trail_amount);
                            orderTpMap.Add(entry_tag, tp_amount);
						}
						
                        else
                        {
                            orderSlMap.Add(entry_tag, sl_amount);
                            orderTpMap.Add(entry_tag, tp_amount);
                        }

                        status = "Enter Short Placed"; // Must only set status IF order is filled
                        alertsStatus.Add(id, status);
                        return;
                    }
                }
            }
            finally
            {
				if (rdr != null) rdr.Close();
                if (conn != null) conn.Close();      
			}
		}

//Not part of the Strategy.
		
		#region Properties

		
		#region 1. Order Limits
		
		[NinjaScriptProperty]
		[PropertyEditor("NinjaTrader.Gui.Tools.TimeEditorKey")]
		[Display(Name="Start Time", Order=0, GroupName="1. Order Limits")]
		public DateTime Start
		{ get; set; }

		[NinjaScriptProperty]
		[PropertyEditor("NinjaTrader.Gui.Tools.TimeEditorKey")]
		[Display(Name="Stop Time", Order=1, GroupName="1. Order Limits")]
		public DateTime Stop
		{ get; set; }

		
		
	
		#endregion
#endregion
	}
}
