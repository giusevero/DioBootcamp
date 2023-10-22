//
//  PersonaView.swift
//  DioSecondFinalChanllenge
//
//  Created by Giugliano Severo on 21/10/23.
//

import Combine
import SwiftUI

struct PersonaView: View {
    
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.personas) { persona in
                PersonaRow(persona: persona)
                    .onAppear(perform: {
                        Task {
                            await viewModel.getNextPage()
                        }
                    })
            }
            .navigationTitle("Personas")
        }.onAppear(perform: {
            Task {
                await viewModel.getPersonas(page: nil)
            }
        })
    }
}

#Preview {
    PersonaView()
}
