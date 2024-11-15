//
//  ContentView.swift
//  RandomGuns
//
//  Created by Ilya Schevchenko on 13.11.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.black, .red]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    //image
                    Image("gun")
                        .resizable()
                        .frame(width: 150, height: 150)
                    
                    //title
                    Text("Random Guns")
                        .font(.system(size: 55))
                        .fontWeight(.bold)
                    
                    //button
                    NavigationLink {
                        GameView()
                    } label: {
                        Text("Start")
                            .font(.title3)
                            .frame(width: 300, height: 50)
                            .background(Color.black)
                            .foregroundStyle(Color.white)
                            .cornerRadius(5.0)
                    }
                    
                    Spacer()
                    
                    //creater
                    Text("Created By: InkaShev777")
                        .font(.footnote)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}
