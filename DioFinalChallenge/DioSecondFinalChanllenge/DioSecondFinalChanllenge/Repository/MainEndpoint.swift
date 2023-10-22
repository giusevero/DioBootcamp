//
//  MainEndpoint.swift
//  DioSecondFinalChanllenge
//
//  Created by Giugliano Severo on 21/10/23.
//

import Foundation

enum MainEndpoint {
    case allPersonas(page: Int?)
    case onlyPersona(id: Int)
}

extension MainEndpoint: Endpoint {
    
    var path: String {
        switch self {
        case .allPersonas:
            "/api/character"
        case .onlyPersona(let id):
            "/api/character/\(id)"
        }
    }
    
    var pathParams: [String : String]? {
        switch self {
        case .allPersonas(let page):
            return page == nil ? nil : ["page": "\(page!)"]
        default:
            return nil
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var header: [String : String]? {
        return [
            "Content-Type": "application/json;charset=utf-8"
        ]
    }
    
    var body: [String : String]? {
        return nil
    }
    
}
