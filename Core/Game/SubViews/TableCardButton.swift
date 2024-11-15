//
//  TableCardButton.swift
//  RandomGuns
//
//  Created by Ilya Schevchenko on 15.11.2024.
//

import SwiftUI

struct TableCardButton: View {
    @Binding var letShooting: Bool
    @Binding var letShowNewCardTable: Bool
    @Binding var isShowCrad: Bool
    
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    CardViewViewModel.shared.titleCradDisplay = ""
                    HapticManager.shared.vibrate(for: .success)
                    SoundManager.shared.soundOfCard()
                    RandomPlayingCardManager.shared.randomCard()
                    
                    
                    letShooting = true
                    letShowNewCardTable = false
                    isShowCrad = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        withAnimation {
                            SoundManager.shared.soundOfCard()
                            isShowCrad = false
                        }
                    }
                    
                } label: {
                    Image(systemName: "suit.spade")
                        .font(.system(size: 24))
                        .foregroundColor(Color.red)
                        .padding()
                        .background(Color.black)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                .disabled(!letShowNewCardTable)
                .opacity(letShowNewCardTable ? 1.0 : 0.5)
            }
        }
        .padding(.horizontal, 2)
    }
}
