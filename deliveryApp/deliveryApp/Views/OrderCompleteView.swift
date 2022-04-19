//
//  OrderCompleteView.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 19.04.2022.
//

import SwiftUI

struct OrderCompleteView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 150) {
                VStack(spacing: 16) {
                    Circle()
                        .fill(.green)
                        .frame(width: 60, height: 60)
                        .overlay(
                            Image(systemName: "checkmark")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 28, height: 28)
                                .foregroundColor(.white)
                        )
                    
                    VStack(spacing: 12) {
                        Text("Thank you for placing the order")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Text("It will get to you as soon as possible")
                            .font(.system(size: 17))
                            .fontWeight(.regular)
                            .foregroundColor(.gray)
                    }
                }
                
                
                Image("order_complete")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 165)
                
                
                NavigationLink(destination: {
                    HomeView()
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                }, label: {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.pink)
                        .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 60)
                        .overlay(
                            Text("Go Home")
                                .font(.system(size: 17))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        )
                })
                
            }
        }
    }
}

struct OrderCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCompleteView()
    }
}
