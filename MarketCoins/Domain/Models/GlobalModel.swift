//
//  GlobalModel.swift
//  MarketCoins
//
//  Created by Giugliano Severo on 04/09/23.
//

import Foundation

// MARK: - GlobalModel
struct GlobalModel: Codable {
    let data: CryptoCurrencyModel
}

// MARK: - DataClass
struct CryptoCurrencyModel: Codable {
    let activeCryptocurrencies, upcomingIcos, ongoingIcos, endedIcos: Int
    let markets: Int
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    let updatedAt: Int

    enum CodingKeys: String, CodingKey {
        case activeCryptocurrencies = "active_cryptocurrencies"
        case upcomingIcos = "upcoming_icos"
        case ongoingIcos = "ongoing_icos"
        case endedIcos = "ended_icos"
        case markets
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
        case updatedAt = "updated_at"
    }
}
