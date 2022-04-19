//
//  UserViewModel.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 19.04.2022.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var paymentMethods: [PaymentModel] = paymentMethodsExamples
}
