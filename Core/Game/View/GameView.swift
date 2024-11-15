//
//  GameView.swift
//  RandomGuns
//
//  Created by Ilya Schevchenko on 13.11.2024.
//

import SwiftUI

struct GameView: View {
    @State var isEmpty = true
    @State var isShowCrad = false
    @State var newUserName: String = ""
    @StateObject var viewModel = GameViewViewModel.shared
    @State var isShowSheet = false
    @State var isDie = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.black, .red]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        if isShowCrad {
                            withAnimation {
                                CardView(cardName: RandomPlayingCardManager.shared.cardTable)
                            }
                        } else {
                            if isEmpty {
                                EmptyGameView(isShowSheet: $isShowSheet)
                                    .padding(.top, 250)
                            } else {
                                ListUsersView(listUsers: viewModel.usersList, isDie: $isDie)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "arrow.clockwise")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 20))
                    .onTapGesture {
                        withAnimation {
                            viewModel.resetGame()
                            isEmpty = true
                            HupticManager.shared.vibrate(for: .success)
                        }
                    }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "suit.spade")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 20))
                    .onTapGesture {
                        isShowCrad = true
                        SoundManager.shared.soundOfCard()
                        RandomPlayingCardManager.shared.randomCard()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            withAnimation {
                                SoundManager.shared.soundOfCard()
                                isShowCrad = false
                            }
                        }
                    }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "plus")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 20))
                    .onTapGesture {
                        isShowSheet = true
                    }
            }
        }
        .navigationBarBackButtonHidden()
        .alert("Add New User", isPresented: $isShowSheet) {
            TextField("Enter your name", text: $newUserName)
            
            Button {
                withAnimation {
                    isShowSheet = false
                    newUserName = ""
                }
            } label: {
                Text("Cancel")
            }
            
            Button{
                viewModel.addNewGamer(name: newUserName)
                if !viewModel.usersList.isEmpty {
                    SoundManager.shared.reelSpin()
                    withAnimation {
                        isEmpty = false
                    }
                }
                newUserName = ""
            } label: {
                Text("OK")
            }
        } message: {
            Text("Username required to play")
        }
    }
}

#Preview {
    GameView()
}
