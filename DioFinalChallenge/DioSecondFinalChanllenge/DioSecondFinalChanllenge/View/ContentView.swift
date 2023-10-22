//
//  ContentView.swift
//  DioSecondFinalChanllenge
//
//  Created by Giugliano Severo on 21/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var goToPersona: Bool = false
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                LoaderView(tintColor: .blue, scaleSize: 3.0).padding(.bottom,50)
            }
        }
    }
}

#Preview {
    ContentView()
}

struct LoaderView: View {
    var tintColor: Color = .blue
    var scaleSize: CGFloat = 1.0
    
    var body: some View {
        ProgressView()
            .scaleEffect(scaleSize, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
    }
}
