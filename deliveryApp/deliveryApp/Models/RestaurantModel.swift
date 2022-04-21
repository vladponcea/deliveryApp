//
//  RestaurantModel.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 19.04.2022.
//

import Foundation

struct Restaurant: Identifiable, Equatable, Codable {
    var id: String
    var name: String
    var desc: String
    var image: String
    var location: String
    var deliveryTime: Double
    var distance: Double
    var rating: Double
    var categories: [FoodCategory]
}

struct FoodCategory: Identifiable, Equatable, Codable {
    var id: String
    var name: String
    var foods: [Food]
}

struct Food: Identifiable, Equatable, Codable {
    var id: String
    var name: String
    var image: String
    var price: Double
    var desc: String
    var extras: [Extra]
    var variations: [Variation]
}

struct Extra: Identifiable, Equatable, Codable {
    var id: String
    var name: String
    var price: Double
}

struct Variation: Identifiable, Equatable, Codable {
    var id: String
    var name: String
    var price: Double
}
