//
//  CartViewModel.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 19.04.2022.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var cart: Cart = cartExample
}
