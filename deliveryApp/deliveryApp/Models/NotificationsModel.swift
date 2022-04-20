//
//  NotificationsModel.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 20.04.2022.
//

import Foundation

struct Notification: Identifiable, Equatable {
    var id: String = UUID().uuidString
    
    var text: String
    var time: String
    var seen: Bool
}

var notificationsExamples: [Notification] = [
    Notification(text: "Your order has arrived", time: "2m", seen: false),
    Notification(text: "Your order is on its way", time: "50m", seen: true),
    Notification(text: "Your order has been placed", time: "1h", seen: true),
    Notification(text: "Confirm your phone number", time: "3d", seen: false),
]
