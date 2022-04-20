//
//  UserViewModel.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 19.04.2022.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var paymentMethods: [PaymentModel] = paymentMethodsExamples
    @Published var savedRestaurants: [Restaurant] = restaurantsExamples
    @Published var notifications: [Notification] = notificationsExamples
    @Published var orders: [Order] = ordersExamples
}
