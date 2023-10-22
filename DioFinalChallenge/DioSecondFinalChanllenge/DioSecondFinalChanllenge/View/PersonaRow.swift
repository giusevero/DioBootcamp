//
//  PersonaRow.swift
//  DioSecondFinalChanllenge
//
//  Created by Giugliano Severo on 21/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PersonaRow: View {
    var persona: Persona
    
    var body: some View {
        HStack(spacing: 8){
            WebImage(url: URL(string: persona.image!))
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(.circle)
            VStack(alignment: .leading) {
                Text(persona.name!)
                    .font(.system(size: 18))
                Text(persona.species!)
                    .font(.system(size: 14))
            }
            HStack(spacing: 4){
                Text("status:")
                    .scaledToFit()
                Image(systemName: "circle.fill")
                    .colorMultiply(persona.status?.color ?? .gray)
                    .scaledToFit()
            }
        }
    }
}

//#Preview {
//    PersonaRow(persona: )
//}
