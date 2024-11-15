//
//  EmptyGameView.swift
//  RandomGuns
//
//  Created by Ilya Schevchenko on 13.11.2024.
//

import SwiftUI

struct EmptyGameView: View {
    @Binding var isShowSheet: Bool
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                
                Image("gun")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Text("To start the game, add players.")
                    .font(.title2)
                
                Button {
                    isShowSheet = true
                } label: {
                    Text("Add Gamer")
                        .frame(width: 200, height: 50)
                        .background(Color.black)
                        .cornerRadius(10.0)
                        .foregroundStyle(Color.white)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

//#Preview {
//    EmptyGameView(isEmpty: true)
//}
