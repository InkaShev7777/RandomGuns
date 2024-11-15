//
//  AddNewGamerView.swift
//  RandomGuns
//
//  Created by Ilya Schevchenko on 13.11.2024.
//

import SwiftUI

struct AddNewGamerView: View {
    @State var newUserName: String = ""
    @Binding var isEmpty: Bool
    @Binding var isShowSheet: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.black, .red]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack {
                Text("New Gamer")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                    .keyboardType(.alphabet)
                    .disableAutocorrection(true)
                
                TextField("Enter your email", text: $newUserName)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                
                Button("Create Gamer") {
                    GameViewViewModel.shared.addNewGamer(name: newUserName)
                    isEmpty = false
                    isShowSheet = false
                    newUserName = ""
                }
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
        }
    }
}

//#Preview {
//    AddNewGamerView()
//}
