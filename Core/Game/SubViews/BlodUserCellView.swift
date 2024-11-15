//
//  BlodUserCellView.swift
//  RandomGuns
//
//  Created by Ilya Schevchenko on 13.11.2024.
//

import SwiftUI

struct BlodUserCellView: View {
    var name: String
    var body: some View {
        VStack {
            ZStack {
                Image("blod")
                    .resizable()
                    .opacity(0.94)
                VStack {
                    HStack {
                        Image("gun")
                            .resizable()
                            .frame(width: 40, height: 40)
                        
                        Text(name)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.black)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    BlodUserCellView(name: "Ilya")
}
