//
//  ColorSelector.swift
//  ArcadeButton
//
//  Created by christian on 12/1/23.
//

import SwiftUI

struct ColorSelector: View {
    let colorOptions: [Color] = [.red, .orange, .yellow, .green, .blue, .indigo, .purple, .mint, .brown, .pink, .teal, .cyan, .gray]

    @Binding var accentColor: Color
    
    var body: some View {
        VStack {
            Text("Select a color")
                .font(.headline)
            ScrollView(.horizontal){
                HStack(spacing: 20) {
                    ForEach(colorOptions, id: \.self) { color in
                        Button {
                            withAnimation(.bouncy){
                                accentColor = color
                            }
                        } label: {
                            Circle()
                                .frame(width: 85)
                                .foregroundStyle(color == accentColor ? color.opacity(0.3) : color)
                        }
                        .disabled(color == accentColor)
                    }
                }
            }
            .scrollTargetBehavior(.paging)
            .shadow(radius: 7, x: 4,  y: 4)
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    ColorSelector(accentColor: .constant(.blue))
}

