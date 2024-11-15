//
//  GameViewViewModel.swift
//  RandomGuns
//
//  Created by Ilya Schevchenko on 13.11.2024.
//

import Foundation
import SwiftUI

class GameViewViewModel: ObservableObject {
    @Published var usersList = [User]()
    @Published var isRefresh: Bool = false
    var selectedUser: User?
    static let shared = GameViewViewModel()
    
    public func addNewGamer(name: String) {
        if name != "" {
            let newUser = User(name: name)
            self.usersList.append(newUser)
        }
    }
    
    public func selectUser(user: User) {
        if !user.id.isEmpty {
            selectedUser = user
        }
    }
    
    public func shoot() {
        guard let user = selectedUser else { return }
        
        if user.isLive {
            if user.positionNow == user.positionBoolet {
                SoundManager.shared.shoot()
                user.isLive = false
            } else {
                if user.positionNow == 6 && user.positionBoolet != user.positionNow {
                    user.positionNow = 1
                } else {
                    user.positionNow += 1
                }
                SoundManager.shared.emptyShoot()
                user.countOfShoot += 1
            }
        } else {
            return
        }
    }
    
    public func getCountOfShoot() -> Int {
        guard let user = selectedUser else { return -1}
        
        return user.countOfShoot
    }
    
    public func isLive() -> Bool {
        guard let user = selectedUser else { return false}
        
        return user.isLive
    }
    
    public func resetGame() {
        selectedUser = nil
        self.usersList = usersList.map { User(name: $0.name) }
    }
    
    public func newGame() {
        usersList = [User]()
        selectedUser = nil
    }
    
}
