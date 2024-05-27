# from webull import webull

# # Create a Webull instance
# # wb = webull()

# # Manually set the 'did' value


# # Login with email and password
# email = "farazmatin@gmail.com"
# password = "PPAftqnnePq3FzH"
# # print(wb.login(email, password))

# # # (Optional) Get trade token for 2FA
# # # code = "your_code"  # Replace with the actual code you receive
# # # wb.get_trade_token(code)

# # # # Save the 'did' for future use
# # # wb._set_did("your_hex_did_value_here")
# wb = webull()

# wb._did = "eungt8kzah0bze2nnixajrcf0uanmzjc"

# wb.login(email, password)

# wb.get_trade_token(code)


from webull import webull

# Create a Webull instance
wb = webull()

# Set the 'did' value
wb._set_did("eungt8kzah0bze2nnixajrcf0uanmzjc")

# Login using your email and password
print(wb.login("farazmatin@gmail.com", "PPAftqnnePq3FzH"))

wb.get_trade_token('661582')
print(wb.place_order(stock='AAPL', price=90.0, quant=2))
print(wb.get_account_id())

print(wb.get_options(stock='AAPL'))
print(wb.get_ticker('AAPL'))