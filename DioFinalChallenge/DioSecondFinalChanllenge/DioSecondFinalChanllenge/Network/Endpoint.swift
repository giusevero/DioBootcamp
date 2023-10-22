//
//  Endpoint.swift
//  DioSecondFinalChanllenge
//
//  Created by Giugliano Severo on 21/10/23.
//

import Foundation

public protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var pathParams: [String: String]? { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
   public var scheme: String {
        return "https"
    }

    public var host: String {
        return "rickandmortyapi.com"
    }
}
