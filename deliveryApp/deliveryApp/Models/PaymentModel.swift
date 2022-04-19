//
//  PaymentModel.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 19.04.2022.
//

import Foundation

struct PaymentModel: Identifiable, Equatable {
    var id: String = UUID().uuidString
    
    let name: String
    let cardType: String
    let lastDigits: Int
}

let paymentMethodsExamples: [PaymentModel] = [
    PaymentModel(name: "John Doe", cardType: "masterCard", lastDigits: 4871),
    PaymentModel(name: "Vlad Poncea", cardType: "visa", lastDigits: 9347),
]
