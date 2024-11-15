//
//  HupticManager.swift
//  RandomGuns
//
//  Created by Ilya Schevchenko on 15.11.2024.
//

import Foundation
import UIKit

final class HapticManager {
    static let shared = HapticManager()
    
    public func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType) {
        DispatchQueue.main.async {
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(type)
        }
    }
}
