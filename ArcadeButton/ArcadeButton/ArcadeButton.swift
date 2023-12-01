//
//  ArcadeButton.swift
//  ArcadeButton
//
//  Created by christian on 12/1/23.
//

import SwiftUI

struct ArcadeButton: View {
    let color: Color
    let scale: Double = 3.0
    
    let action: () -> ()
        
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Circle() // Base layer
                    .foregroundStyle(.black)
                    .shadow(radius: 7, x: 10, y: 10)
                
                Circle() // Outer ring
                    .stroke(lineWidth: geo.size.width * 0.07)
                
                Circle() // Outer ring shading
                    .stroke(lineWidth: geo.size.width * 0.07)
                    .foregroundStyle(RadialGradient(
                        gradient: Gradient(colors: [.clear, .clear, .clear, .clear, .clear, .black.opacity(0.5)]),
                        center: .center,
                        startRadius: 0,
                        endRadius: geo.size.width * 0.6
                    ))
                Button { // Pressable Button
                    action()
                    
                } label : {
                    ZStack {
                        Circle() // Button base layer
                            .padding(geo.size.width * 0.05)
                        
                        Circle() // Ridge shading
                            .padding(geo.size.width * 0.04)
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.black.opacity(0.2), .clear, .clear],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .padding(geo.size.width * 0.08)
                        
                        Circle() // Concave shading
                            .foregroundStyle(
                                RadialGradient(
                                    gradient: Gradient(colors: [.white, .black]),
                                    center: .center,
                                    startRadius: 0,
                                    endRadius: geo.size.width * 0.6
                                )
                            )
                            .padding(geo.size.width * 0.12)
                            .opacity(0.15)
                        
                    }
                }
                .withArcadeButtonStyle()
                
            }
            .foregroundStyle(color)
            
        }
        .padding()
        .frame(width: scale * 100, height: scale * 100)

    }
}

#Preview {
    ArcadeButton(color: .yellow) {
        // action closure
    }
}

struct ArcadeButtonStyle: ButtonStyle {
    let scaleAmount: CGFloat = 0.96
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaleAmount : 1.0)
            .brightness(configuration.isPressed ? -0.04 : 0)
    }
}

extension View {
    func withArcadeButtonStyle() -> some View {
        buttonStyle(ArcadeButtonStyle())
    }
}

