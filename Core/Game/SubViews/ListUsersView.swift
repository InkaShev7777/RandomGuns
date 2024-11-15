//
//  ListUsersView.swift
//  RandomGuns
//
//  Created by Ilya Schevchenko on 13.11.2024.
//

import SwiftUI

struct ListUsersView: View {
    var listUsers: [User]
    @Binding var isDie: Bool
    
    var body: some View {
        VStack {
            ForEach(listUsers){ user in
                VStack {
                    UserCellView(countOfShoot: user.countOfShoot, user: user, isDie: $isDie)
                        .padding(.vertical, 20)
                }
            }
        }
    }
}

//#Preview {
//    ListUsersView()
//}
