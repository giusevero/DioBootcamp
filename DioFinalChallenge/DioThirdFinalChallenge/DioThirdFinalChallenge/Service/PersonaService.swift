//
//  PersonaService.swift
//  DioThirdFinalChallenge
//
//  Created by Giugliano Severo on 02/10/23.
//

import Foundation
import DioBootcampNetwork

protocol PersonaServiceProtocol {
    func getAllPersonas(page: Int?) async -> Result<AllCharacters, RequestError>
    func getOnlyPersona(id: Int) async -> Result<Persona, RequestError>
}

struct PersonaService: PersonaServiceProtocol, HTTPClient {
    
    func getAllPersonas(page: Int?) async -> Result<AllCharacters, DioBootcampNetwork.RequestError> {
        return await sendRequest(endpoint: PersonaEndpoint.allPersonas(page: page), responseModel: AllCharacters.self)
    }
    
    func getOnlyPersona(id: Int) async -> Result<Persona, DioBootcampNetwork.RequestError> {
        return await sendRequest(endpoint: PersonaEndpoint.onlyPersona(id: id), responseModel: Persona.self)
    }
    
}
