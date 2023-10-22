//
//  ViewModel.swift
//  DioSecondFinalChanllenge
//
//  Created by Giugliano Severo on 21/10/23.
//

import Combine
import Foundation
import RickMortySwiftApi

class MainViewModel: ObservableObject {
    
    @Published var personas: Personas = []
    private var cancellables: Set<AnyCancellable> = []
    let service = MainService()
    var hasNext: Bool = false
    var nextPage: Int = 0
    
    func getPersonas(page: Int?) async {
        let result = await service.getAllPersonas(page: page)
        
        await MainActor.run{
            switch result {
            case .success(let success):
                if let next = success.info?.next {
                    hasNext = true
                    nextPage = Int(String(next.last ?? "0")) ?? 0
                }
                personas.isEmpty ? personas = success.results! : personas.append(contentsOf: success.results!)
            case let .failure(error):
                print(error)
                personas = []
            }
        }
    }
    
    func getNextPage() async {
       await getPersonas(page: self.nextPage)
    }
    
}
