//
//  MainService.swift
//  DioSecondFinalChanllenge
//
//  Created by Giugliano Severo on 21/10/23.
//

import Foundation

protocol MainServiceProtocol {
    func getAllPersonas(page: Int?) async -> Result<AllCharacters, RequestError>
    func getOnlyPersona(id: Int) async -> Result<Persona, RequestError>
}

struct MainService: MainServiceProtocol, HTTPClient {
    
    func getAllPersonas(page: Int?) async -> Result<AllCharacters, RequestError> {
        return await sendRequest(endpoint: MainEndpoint.allPersonas(page: page), responseModel: AllCharacters.self)
    }
    
    func getOnlyPersona(id: Int) async -> Result<Persona, RequestError> {
        return await sendRequest(endpoint: MainEndpoint.onlyPersona(id: id), responseModel: Persona.self)
    }
    
    
}

//protocol PersonaServiceProtocol {
//    func getAllPersonas(page: Int?) async -> Result<AllCharacters, RequestError>
//    func getOnlyPersona(id: Int) async -> Result<Persona, RequestError>
//}
//
//struct PersonaService: PersonaServiceProtocol, HTTPClient {
//    
//    func getAllPersonas(page: Int?) async -> Result<AllCharacters, DioNetworkBootcamp.RequestError> {
//        return await sendRequest(endpoint: PersonaEndpoint.allPersonas(page: page), responseModel: AllCharacters.self)
//    }
//    
//    func getOnlyPersona(id: Int) async -> Result<Persona, DioNetworkBootcamp.RequestError> {
//        return await sendRequest(endpoint: PersonaEndpoint.onlyPersona(id: id), responseModel: Persona.self)
//    }
//    
//}
