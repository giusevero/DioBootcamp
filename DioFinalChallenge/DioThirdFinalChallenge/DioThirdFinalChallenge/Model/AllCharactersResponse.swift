//
//  AllCharactersResponse.swift
//  DioThirdFinalChallenge
//
//  Created by Giugliano Severo on 29/09/23.
//

import Foundation
import UIKit

struct AllCharacters: Codable {
    var info: PaginationInfo?
    var results: [Persona]?
}

// MARK: - Info
struct PaginationInfo: Codable {
    var count, pages: Int?
    var next: String?
    var prev: String?
}

typealias Personas = [Persona]

// MARK: - Result
struct Persona: Codable {
    var id: Int?
    var name, species, type: String?
    var status: Status?
    var gender: String?
    var origin, location: Location?
    var image: String?
    var episode: [String]?
    var url: String?
    var created: String?
}

// MARK: - Location
struct Location: Codable {
    var name: String?
    var url: String?
}

enum Status: String, Codable {
    case Alive = "Alive"
    case Dead = "Dead"
    case unknown = "unknown"
    
}

extension Status {
    
    var color: UIColor {
        switch self {
        case .Alive:
            return .green
        case .Dead:
            return .red
        case .unknown:
            return .gray
        }
    }
}
