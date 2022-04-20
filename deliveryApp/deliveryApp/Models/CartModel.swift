//
//  CartModel.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 19.04.2022.
//

import Foundation

struct Cart: Identifiable, Equatable {
    var id: String = UUID().uuidString
    
    let items: [CartItem]
}

struct CartItem: Identifiable, Equatable {
    var id: String = UUID().uuidString
    
    let food: Food
    let quantity: Int64
}

let cartExample: Cart = Cart(items: [CartItem(food: foodExamples[0], quantity: 1), CartItem(food: foodExamples[1], quantity: 3)])
