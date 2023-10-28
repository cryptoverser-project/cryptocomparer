# Packages
library(dplyr)
library(purrr)
library(httr)


api_key = "153bc970c37d2a4d8e6735f89d5602b7787f9765e0add94ad960ff91b0326813"


source("function/Utils.R")
source("function/Api_Tools.R")

# base Api Function
source("functions/cryptocompare_api.R") 


# [cc_symbol_price]: Simple Price for a Symbol for different currencies or exchanges 

source("functions/cc_symbol_price.R")

cc_symbol_price(symbol = c("BTC", "ETH", "SOL", "BNB", "LAZIO"), currency = c("BUSD", "EUR", "BTC", "ETH"), exchange = c("binance", "kucoin"), api_key = NULL)
cc_symbol_price(symbol = c("BTC", "ETH", "SOL", "BNB", "LAZIO"), currency = c("BUSD", "EUR", "BTC", "ETH"), exchange = c("binance"), api_key = NULL)
cc_symbol_price(symbol = c("BTC"), currency = c( "EUR"), exchange = NULL, api_key = NULL)
cc_symbol_price(symbol = c("BTC", "ETH", "SOL", "BNB", "LAZIO"), currency = c("BUSD", "EUR", "BTC", "ETH"), exchange = NULL, api_key = NULL)


# [cc_price_historical]: Historical OHLCV data for a Pair (Symbol + Currency) 

source("functions/cc_price_historical.R") 

cc_price_historical(symbol = "BTC", start = "2022-06-01", end = "2022-07-12",  exchange = "binance", currency = "USDC", interval = "daily", api_key = NULL) 
cc_price_historical(symbol = "BTC", start = "2022-06-01 03:00", end = "2022-07-12",  exchange = "binance", currency = "USDT", interval = "hourly", api_key = NULL) 
cc_price_historical(symbol = "BTC", start = NULL, end = Sys.time(),  exchange = "binance", currency = "USDT", interval = "minutely", api_key = NULL) 


# [cc_exchange_historical]

source("functions/cc_exchange_historical.R") 

cc_exchange_historical(symbol = "BNB", start = "2021-01-01", end = "2021-07-01",  exchange = "binance", currency = "USD", interval = "daily", api_key = NULL)
cc_exchange_historical(symbol = "BTC", start = "2022-01-01", end = "2022-07-01",  exchange = NULL, currency = "USD", interval = "hourly", api_key = NULL)
cc_exchange_historical(symbol = NULL, start = "2022-01-01", end = "2022-07-01",  exchange = "kraken", currency = "USDT", interval = "daily", api_key = NULL)

# [cc_exchange_historical]

source("functions/cc_social_historical.R") 

cc_social_historical(symbol = "BNB", start = "2021-01-01", end = "2021-07-01", interval = "daily", api_key = NULL)
cc_social_historical(symbol = "BTC", start = "2022-01-01", end = "2022-07-01", interval = "hourly", api_key = NULL)


# [cc_market_info]

source("functions/cc_market_info.R")

cc_maket_info("coins") 
cc_maket_info("exchanges")

cc_maket_info("gambling", api_key = api_key)
cc_maket_info("wallets", api_key = api_key)
cc_maket_info("cards", api_key = api_key) 
cc_maket_info("contracts", api_key = api_key)
cc_maket_info("companies", api_key = api_key)
cc_maket_info("equipment", api_key = api_key)
cc_maket_info("pools", api_key = api_key)
cc_maket_info("blockchain", api_key = api_key)




# [cc_blockchain_balance] Bitcoin Blockchain Balances 

source("functions/cc_blockchain.R")

BTC_balance = cc_blockchain_balance("2022-12-23", "2022-12-24", api_key = api_key)

BTC_balance %>%
  group_by(Date) %>%
  summarise(Amount = sum(Amount)) %>%
  ggplot(aes(Date, Amount))+
  geom_line()


# [cc_eth_staking] Ethereum Staking APR
cc_eth_staking("2022-01-01", "2022-12-24", api_key = api_key) %>%
  ggplot()+
  geom_line(aes(Date, Rate))


BTC_chain = cc_blockchain_historical(symbol = "BTC", start = "2017-04-08", end = as.character(Sys.time()),  api_key = api_key )

BTC_chain
