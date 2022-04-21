//
//  UserModel.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 20.04.2022.
//

import Foundation

struct User: Identifiable, Equatable, Codable {
    var id: String
    var firstName: String
    var lastName: String
    var phoneNumber: Double
    var email: String
    var cart: Cart
    var notifications: [Notification]
    var orders: [Order]
    var paymentMethods: [PaymentMethod]
}

struct Cart: Identifiable, Equatable, Codable {
    var id: String
    var items: [CartItem]
}

struct CartItem: Identifiable, Equatable, Codable {
    var id: String
    var item: Food
    var quantity: Int
}

struct Notification: Identifiable, Equatable, Codable {
    var id: String
    var text: String
    var time: String
    var seen: Bool
}

struct Order: Identifiable, Equatable, Codable {
    var id: String
    var date: String
    var price: Double
    var restaurant: Restaurant
    var items: [OrderItem]
}

struct OrderItem: Identifiable, Equatable, Codable {
    var id: String
    var food: Food
    var quantity: Int
}

struct PaymentMethod: Identifiable, Equatable, Codable {
    var id: String
    var name: String
    var lastDigits: Int
}
