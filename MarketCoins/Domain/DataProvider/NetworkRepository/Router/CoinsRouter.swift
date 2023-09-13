//
//  CoinsRouter.swift
//  MarketCoins
//
//  Created by Giugliano Severo on 04/09/23.
//

import Foundation

enum CoinsRouter {
    
    case coinsMarkets(currrency: String, cryptoCurrency: [String]?,
                      order: String, parPage: Int, page: Int, percentage: String)
    case coinsByIdMarketChat(id: String, currency: String, from: String, to String)
    case coinsByIdOhlc
    case coinsById
}
