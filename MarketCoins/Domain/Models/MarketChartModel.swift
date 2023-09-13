//
//  MarketChartModel.swift
//  MarketCoins
//
//  Created by Giugliano Severo on 04/09/23.
//

import Foundation

// MARK: - MarketChart
struct MarketChart: Codable {
    let prices: [GraphicsDataModel]
    let marketCaps, totalVolumes: [GraphicsDataModel]?

    enum CodingKeys: String, CodingKey {
        case prices
        case marketCaps = "market_caps"
        case totalVolumes = "total_volumes"
    }
}
