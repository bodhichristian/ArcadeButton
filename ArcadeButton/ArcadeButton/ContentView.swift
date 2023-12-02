//
//  ContentView.swift
//  ArcadeButton
//
//  Created by christian on 12/1/23.
//

import SwiftUI

struct ContentView: View {
    @State var buttonColor: Color = .yellow
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(
                    colors: [.white.opacity(0.5), buttonColor],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .opacity(0.3)
                .ignoresSafeArea()
                
                VStack {
                    ArcadeButton(color: buttonColor) {
                        // do something
                    }
                    .padding(.bottom, 50)
                    
                    ColorPicker("Select a Color", selection: $buttonColor)
                        .font(.headline)
                        .padding()
                }
                .navigationTitle("ArcadeButton")
            }
        }
    }
}

#Preview {
    ContentView()
}




