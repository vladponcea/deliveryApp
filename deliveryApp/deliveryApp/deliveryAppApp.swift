//
//  deliveryAppApp.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 15.04.2022.
//

import SwiftUI

@main
struct deliveryAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomePageView()
                .preferredColorScheme(.light)
                .environmentObject(UserViewModel())
                .environmentObject(CartViewModel())
        }
    }
}
