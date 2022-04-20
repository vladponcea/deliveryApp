//
//  OrderDetailsView.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 20.04.2022.
//

import SwiftUI

struct OrderDetailsView: View {
    
    let order: Order
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1).ignoresSafeArea()
            
            VStack(spacing: 0) {
                TopBarView(text: order.restaurant.name)
                    .frame(width: UIScreen.main.bounds.width)
                    .background(.white)
                
                ScrollView(.vertical, showsIndicators: false) {
                    //order summary
                    VStack(spacing: 0) {
                        HStack {
                            Text("Order Summary")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                        .padding(.bottom, 20)
                        .padding(.top, 20)
                        .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
                        
                        VStack(spacing: 0) {
                            ForEach(order.food) {food in
                                VStack(spacing: 0) {
                                    HStack {
                                        Text(food.name)
                                            .font(.system(size: 17))
                                            .fontWeight(.regular)
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                        
                                        Text("$\(String(format: "%.1f", food.price))")
                                            .font(.system(size: 17))
                                            .fontWeight(.regular)
                                            .foregroundColor(.gray)
                                    }
                                    .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 55)
                                    
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width)
                                }
                            }
                            
                            //subtotal
                            HStack {
                                Text("Subtotal")
                                    .font(.system(size: 17))
                                    .fontWeight(.regular)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Text("$50")
                                    .font(.system(size: 17))
                                    .fontWeight(.regular)
                                    .foregroundColor(.gray)
                            }
                            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 55)
                            
                            Divider()
                                .frame(width: UIScreen.main.bounds.width)
                            
                            //delivery fee
                            HStack {
                                Text("Delivery fee")
                                    .font(.system(size: 17))
                                    .fontWeight(.regular)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Text("$5")
                                    .font(.system(size: 17))
                                    .fontWeight(.regular)
                                    .foregroundColor(.gray)
                            }
                            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 55)
                            
                            Divider()
                                .frame(width: UIScreen.main.bounds.width)
                            
                            //VAT
                            HStack {
                                Text("VAT")
                                    .font(.system(size: 17))
                                    .fontWeight(.regular)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Text("$4")
                                    .font(.system(size: 17))
                                    .fontWeight(.regular)
                                    .foregroundColor(.gray)
                            }
                            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 55)
                            
                            Divider()
                                .frame(width: UIScreen.main.bounds.width)
                            
                            //coupon
                            HStack {
                                Text("Coupon")
                                    .font(.system(size: 17))
                                    .fontWeight(.regular)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Text("+$4")
                                    .font(.system(size: 17))
                                    .fontWeight(.regular)
                                    .foregroundColor(.green)
                            }
                            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 55)
                            
                            Divider()
                                .frame(width: UIScreen.main.bounds.width)
                        }
                        
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .background(.white)
                    
                    //delivery address
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text("Delivery Address")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                        .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
                        Text("Bloc P1, Rosiori de Vede, Teleorman")
                            .font(.system(size: 17))
                            .fontWeight(.regular)
                            .foregroundColor(.gray)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .background(.white)
                    
                    //delivery instructions
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Delivery Instruction")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                        .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
                        
                        Text("I am at home at around 11 pm")
                            .font(.system(size: 17))
                            .fontWeight(.regular)
                            .foregroundColor(.gray)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .background(.white)
                    
                    //payment method
                    VStack {
                        HStack {
                            Text("Payment Method")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                        .padding(.bottom, 20)
                        .padding(.top, 20)
                        .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
                        
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.purple)
                            .frame(height: 200)
                            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 200)
                            .overlay(alignment: .topTrailing, content: {
                                HStack {
                                    Text("••••")
                                        .font(.system(size: 22))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Text("\(String(order.paymentMethod.lastDigits))")
                                        .font(.system(size: 22))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .padding()
                            })
                            .overlay(alignment: .bottomLeading, content: {
                                Text(order.paymentMethod.name)
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                            })
                            .overlay(alignment: .topTrailing, content: {
                                Circle()
                                    .fill(.white.opacity(0.1))
                                    .frame(width: 200, height: 200)
                                    .offset(x: 50, y: -100)
                                    .clipped()
                            })
                            .overlay(alignment: .topLeading, content: {
                                Circle()
                                    .fill(.black.opacity(0.1))
                                    .frame(width: 200, height: 200)
                                    .offset(x: -100, y: -50)
                                    .clipped()
                            })
                            .overlay(alignment: .bottom, content: {
                                Circle()
                                    .fill(.white.opacity(0.3))
                                    .frame(width: 200, height: 200)
                                    .offset(x: 50, y: 150)
                            })
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .background(.white)
                    
                    Button(action: {}, label: {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.red)
                            .frame(height: 60)
                            .overlay(
                                Text("Cancel order")
                                    .font(.system(size: 17))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            )
                            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
                    })
                }
            }
            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
            .ignoresSafeArea(edges: .top)
        }
    }
}

struct OrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailsView(order: ordersExamples[0])
    }
}
