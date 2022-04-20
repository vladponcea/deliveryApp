//
//  OrderModel.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 20.04.2022.
//

import Foundation

struct Order: Identifiable, Equatable {
    var id: String = UUID().uuidString
    
    let restaurant: Restaurant
    let food: [Food]
    let date: String
    let price: Double
    let paymentMethod: PaymentModel
}

let ordersExamples: [Order] = [
    Order(restaurant: restaurantsExamples[0], food: foodExamples, date: "03 Mar 2020", price: 20, paymentMethod: paymentMethodsExamples[0]),
    Order(restaurant: restaurantsExamples[1], food: foodExamples, date: "10 Jun 2020", price: 25, paymentMethod: paymentMethodsExamples[0]),
    Order(restaurant: restaurantsExamples[0], food: foodExamples, date: "03 Mar 2020", price: 20, paymentMethod: paymentMethodsExamples[1]),
    Order(restaurant: restaurantsExamples[1], food: foodExamples, date: "28 Jan 2020", price: 90, paymentMethod: paymentMethodsExamples[0]),
]
