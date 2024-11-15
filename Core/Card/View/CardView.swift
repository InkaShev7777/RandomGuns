//
//  CardView.swift
//  RandomGuns
//
//  Created by Ilya Schevchenko on 13.11.2024.
//

import SwiftUI

struct CardView: View {
    @State private var scale: CGFloat = 1.0
    @State private var tableName: String = ""
    var cardName: String
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(cardName)
                .resizable()
                .frame(width: 350, height: 450)
                .scaleEffect(scale)
                .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true), value: scale)
                .onAppear {
                    scale = 1.2

                    if cardName == "king" {
                        tableName = "KING`S TABLE"
                        SoundManager.shared.kingTableCard()
                    } else if cardName == "ace" {
                        tableName = "ACE`S TABLE"
                        SoundManager.shared.aceTableCard()
                    } else if cardName == "queen" {
                        tableName = "QUEEN`S TABLE"
                        SoundManager.shared.queenTableCard()
                    }
                    
                    CardViewViewModel.shared.titleCradDisplay = tableName
                }
            
            Text(tableName)
                .font(.system(size: 45, weight: .bold, design: .monospaced))
                .fontWeight(.bold)
                .padding(.vertical, 100)
            
            Spacer()
        }
    }
}

#Preview {
    CardView(cardName: "ace")
}
