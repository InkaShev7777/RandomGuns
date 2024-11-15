//
//  UserCellView.swift
//  RandomGuns
//
//  Created by Ilya Schevchenko on 13.11.2024.
//

import SwiftUI

struct UserCellView: View {
    @State var countOfShoot: Int
    @State var isLive: Bool = true
    @StateObject var viewModel = GameViewViewModel.shared
    @StateObject var user: User
    @Binding var isDie: Bool
    @State var isShowLongPressAlert: Bool = false
    
    var body: some View {
        ZStack {
            if !isLive {
                Image("blod")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .opacity(0.94)
                    .cornerRadius(10.0)
                
                ZStack {
                    Rectangle()
                        .fill(Color.black.opacity(0.8))
                        .frame(width: 250, height: 250)
                        .cornerRadius(10.0)
                        .blur(radius: 8.0)
                    
                    Text("DEAD")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .rotationEffect(.degrees(-45))
                }
                .offset(x: 0, y: 0)
                .zIndex(10.0)
            }
            
            VStack {
                HStack(spacing: 5) {
                    Image("gun")
                        .resizable()
                        .frame(width: 37, height: 37)
                    
                    Text(user.name)
                        .font(.system(size: 32))
                        .fontWeight(.semibold)
                        .foregroundStyle(isLive ? Color.black : Color.white)
                }
                .padding()
                
                VStack {
                    Text("\(countOfShoot)/6")
                        .font(.system(size: 60))
                        .foregroundStyle(isLive ? Color.black : Color.white)
                        .fontWeight(.bold)
                        .contentTransition(.numericText(countsDown: true))
                    
                    if isLive {
                        Button {
                            withAnimation {
                                viewModel.selectUser(user: user)
                                viewModel.shoot()
                                countOfShoot = viewModel.getCountOfShoot()
                                isLive = viewModel.isLive()
                                isDie = !isLive
                                if isDie {
                                    HapticManager.shared.vibrate(for: .error)
                                } else {
                                    HapticManager.shared.vibrate(for: .success)
                                }
                            }
                        } label: {
                            Text("Shoot")
                                .font(.title)
                                .frame(width: 150, height: 40)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.white)
                                .background(Color.black)
                                .cornerRadius(5.0)
                        }
                    }
                }
                
                Spacer()
            }
            .frame(width: 250, height: 250)
            .background(Color.gray.opacity( isLive ? 0.5 : 0 ))
            .cornerRadius(10.0)
            .onLongPressGesture {
                withAnimation {
                    isShowLongPressAlert = true
                }
            }
            .alert("Delete Gamer \(user.name)", isPresented: $isShowLongPressAlert) {
                
                Button("Cancel", role: .cancel) {
                    withAnimation {
                        isShowLongPressAlert = false
                    }
                }
                
                Button("DELETE", role: .destructive) {
                    withAnimation {
                        viewModel.deleteUser(user: user)
                        isShowLongPressAlert = false
                    }
                }
            } message: {
                Text("Are you sure you want to delete the gamer \(user.name)?")
            }
            .onAppear {
                isLive = user.isLive
            }
        }
    }
}

//#Preview {
//    UserCellView(name: "Ilya", countOfShoot: 1)
//}
