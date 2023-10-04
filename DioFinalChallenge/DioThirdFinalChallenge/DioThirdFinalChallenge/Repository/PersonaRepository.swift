//
//  PersonaRepository.swift
//  DioThirdFinalChallenge
//
//  Created by Giugliano Severo on 02/10/23.
//

import Foundation

class PersonaRepository {
    
    var personas: [Persona] = []
    var personaResponse = AllCharacters()
    var lastPage = PaginationInfo()
    var service = PersonaService()
    var selectedPersona = Persona()
    
    static let shared = PersonaRepository()
    
    init() {
        
    }
    
}
