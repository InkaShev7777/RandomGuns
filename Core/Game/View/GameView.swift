//
//  GameView.swift
//  RandomGuns
//
//  Created by Ilya Schevchenko on 13.11.2024.
//

import SwiftUI

struct GameView: View {
    @State var isShowCrad = false
    @State var newUserName: String = ""
    @StateObject var viewModel = GameViewViewModel.shared
    @State var isEmpty: Bool
    @State var isShowSheet = false
    @State var isDie = false
    @State var letShowNewCardTable = true
    @State var letShooting = false
    
    init() {
        isEmpty = GameViewViewModel.shared.isEmpty()
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.black, .red]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack {
                    if CardViewViewModel.shared.titleCradDisplay != "" {
                        Text(CardViewViewModel.shared.titleCradDisplay)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.white)
                            .padding(.top, 20)
                    }
                    
                    ScrollView {
                        VStack {
                            if isShowCrad {
                                withAnimation {
                                    CardView(cardName: RandomPlayingCardManager.shared.cardTable)
                                }
                            } else {
                                if viewModel.isEmpty() {
                                    EmptyGameView(isShowSheet: $isShowSheet)
                                        .padding(.top, 250)
                                } else {
                                    ListUsersView(listUsers: viewModel.usersList, isDie: $isDie, letShowNewCardTable: $letShowNewCardTable, letShooting: $letShooting)
                                        .frame(maxWidth: .infinity)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                if !isEmpty && !isShowCrad {
                    ZStack {
                        TableCardButton(letShooting: $letShooting, letShowNewCardTable: $letShowNewCardTable, isShowCrad: $isShowCrad)
                            .padding(.horizontal)
                        
                    }
                }
            }
            .frame(width: geometry.size.width)
        }
        .toolbar {
            if !isEmpty {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 20))
                        .onTapGesture {
                            CardViewViewModel.shared.titleCradDisplay = ""
                            viewModel.newGame()
                            isEmpty = true
                            HapticManager.shared.vibrate(for: .error)
                        }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 20))
                        .onTapGesture {
                            withAnimation {
                                CardViewViewModel.shared.titleCradDisplay = ""
                                letShowNewCardTable = true
                                viewModel.resetGame()
                                HapticManager.shared.vibrate(for: .success)
                            }
                        }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "plus")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 20))
                        .onTapGesture {
                            withAnimation {
                                isShowSheet = true
                                HapticManager.shared.vibrate(for: .success)
                            }
                        }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .alert("Add New User", isPresented: $isShowSheet) {
            TextField("Enter your name", text: $newUserName)
            
            Button("Cancel", role: .cancel) {
                withAnimation {
                    HapticManager.shared.vibrate(for: .error)
                    isShowSheet = false
                    newUserName = ""
                }
            }
            
            Button("OK") {
                viewModel.addNewGamer(name: newUserName)
                if !viewModel.usersList.isEmpty {
                    SoundManager.shared.reelSpin()
                    withAnimation {
                        isEmpty = false
                        HapticManager.shared.vibrate(for: .success)
                    }
                }
                newUserName = ""
            }
        } message: {
            Text("Username required to play.")
        }
    }
}

#Preview {
    GameView()
}
