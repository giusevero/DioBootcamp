//
//  API.swift
//  MarketCoins
//
//  Created by Giugliano Severo on 04/09/23.
//

import Foundation

struct API {
    
    static let baseURL = "https://api.coingecko.com/api/v3"
    static let coinsMarket = "/coins/markets"
    static let coinsIdMarketChart = "/coins/%@/market_chart/range"
    static let coinsByIdOhlc = "coins/%@/ohlc"
    static let global = "/global/"
    static let coinsById = "/coins/%@"
    
}
