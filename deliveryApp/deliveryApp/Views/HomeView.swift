//
//  HomeView.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 15.04.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Hello")
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
