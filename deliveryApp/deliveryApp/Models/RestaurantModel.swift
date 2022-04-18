//
//  RestaurantModel.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 19.04.2022.
//

import Foundation

struct Restaurant: Identifiable, Equatable {
    var id: String = UUID().uuidString
    
    let name: String
    let desc: String
    let image: String
    let location: String
    let deliveryTime: Double
    let distance: Double
    let rating: Double
    let categories: [FoodCategory]
    let food: [Food]
}

let restaurantsExamples: [Restaurant] = [
    Restaurant(name: "Daily Deli", desc: "Delicious and healthy", image: "food1", location: "Lohar Town", deliveryTime: 40, distance: 1.2, rating: 4.7, categories: foodCategoriesExamples, food: foodExamples),
    Restaurant(name: "Burger Mania", desc: "Delicious Fast-Food", image: "food4", location: "Lohar Town", deliveryTime: 50, distance: 0.5, rating: 4.3, categories: foodCategoriesExamples, food: foodExamples),
]
