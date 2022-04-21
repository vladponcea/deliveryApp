//
//  UserViewModel.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 19.04.2022.
//

import Foundation
import Firebase

class UserViewModel: ObservableObject {
    @Published var user: User = User(id: "", firstName: "", lastName: "", phoneNumber: 0, email: "", cart: Cart(id: "", items: [CartItem(id: "", item: Food(id: "", name: "", image: "", price: 0, desc: "", extras: [Extra(id: "", name: "", price: 0)], variations: [Variation(id: "", name: "", price: 0)]), quantity: 0)]), notifications: [Notification(id: "", text: "", time: "", seen: false)], orders: [Order(id: "", date: "", price: 0, restaurant: Restaurant(id: "", name: "", desc: "", image: "", location: "", deliveryTime: 0, distance: 0, rating: 0, categories: [FoodCategory(id: "", name: "", foods: [Food(id: "", name: "", image: "", price: 0, desc: "", extras: [Extra(id: "", name: "", price: 0)], variations: [Variation(id: "", name: "", price: 0)])])]), items: [OrderItem(id: "", food: Food(id: "", name: "", image: "", price: 0, desc: "", extras: [Extra(id: "", name: "", price: 0)], variations: [Variation(id: "", name: "", price: 0)]), quantity: 0)])], paymentMethods: [PaymentMethod(id: "", name: "", lastDigits: 0)])
    
    func getData() {
        //get database reference
        let db = Firestore.firestore()
        
        //read the documents
        db.collection("user")
    }
}
