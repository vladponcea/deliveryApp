//
//  OrdersView.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 20.04.2022.
//

import SwiftUI

struct OrdersView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        ZStack {
            VStack {
                TopBarView(text: "My Orders")
                
                //recent orders scrollview
                VStack {
                    HStack {
                        Text("Recent orders")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(userViewModel.orders) {order in
                                NavigationLink(destination: {
                                    OrderDetailsView(order: order)
                                        .navigationBarTitle("")
                                        .navigationBarHidden(true)
                                        .navigationBarBackButtonHidden(true)
                                }, label: {
                                    VStack(alignment: .leading) {
                                        Image(order.restaurant.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 240, height: 160)
                                            .cornerRadius(16)
                                        
                                        Text(order.restaurant.name)
                                            .font(.system(size: 17))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                        
                                        Text("$\(String(format: "%.1f", order.price))")
                                            .font(.system(size: 15))
                                            .fontWeight(.regular)
                                            .foregroundColor(.gray)
                                    }
                                })
                            }
                        }
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        ForEach(userViewModel.orders) {order in
                            NavigationLink(destination: {
                                OrderDetailsView(order: order)
                                    .navigationBarTitle("")
                                    .navigationBarHidden(true)
                                    .navigationBarBackButtonHidden(true)
                            }, label: {
                                VStack(spacing: 0) {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(order.restaurant.name)
                                                .font(.system(size: 17))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.black)
                                            
                                            Text(order.date)
                                                .font(.system(size: 15))
                                                .fontWeight(.regular)
                                                .foregroundColor(.gray)
                                        }
                                        
                                        Spacer()
                                        
                                        HStack(spacing: 12) {
                                            Text("$\(String(format: "%.1f", order.price))")
                                                .font(.system(size: 17))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.gray)
                                            
                                            Image(systemName: "chevron.right")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 10, height: 10)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 78)
                                    
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width)
                                }
                            })
                        }
                    }
                }
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
            .ignoresSafeArea(edges: .top)
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
            .environmentObject(UserViewModel())
    }
}
