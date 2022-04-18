//
//  FoodModel.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 19.04.2022.
//

import Foundation

struct Food: Identifiable, Equatable {
    var id: String = UUID().uuidString
    
    let name: String
    let desc: String
    let variations: [Extra]
    let extras: [Extra]
    let image: String
    let price: Double
}

struct FoodCategory: Identifiable, Equatable {
    var id: String = UUID().uuidString
    
    let name: String
    let foods: [Food]
}

struct Extra: Identifiable, Equatable {
    var id: String = UUID().uuidString
    
    let name: String
    let price: Double
}

let foodExamples: [Food] = [
    Food(name: "Chicken Fajita Pizza", desc: "Tasty and satistying", variations: [Extra(name: "8\"", price: 10), Extra(name: "10\"", price: 12), Extra(name: "12\"", price: 16)], extras: [Extra(name: "Texas Barbeque", price: 6), Extra(name: "Char Donay", price: 8)], image: "food1", price: 10),
    Food(name: "Chicken Fajita Burrito", desc: "Very good very nice", variations: [Extra(name: "S", price: 14), Extra(name: "M", price: 16), Extra(name: "L", price: 20)], extras: [Extra(name: "Texas Barbeque", price: 6), Extra(name: "Char Donay", price: 8)], image: "food3", price: 14),
    Food(name: "Beef Burger", desc: "Tasty and satistying", variations: [Extra(name: "8\"", price: 10), Extra(name: "10\"", price: 12), Extra(name: "12\"", price: 16)], extras: [Extra(name: "Texas Barbeque", price: 6), Extra(name: "Char Donay", price: 8)], image: "food1", price: 10),
]

let foodCategoriesExamples: [FoodCategory] = [
    FoodCategory(name: "Popular", foods: foodExamples),
    FoodCategory(name: "Deals", foods: foodExamples),
    FoodCategory(name: "Wraps", foods: foodExamples),
    FoodCategory(name: "Sandwiched", foods: foodExamples),
]
