//
//  CheckoutView.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 19.04.2022.
//

import SwiftUI

struct CheckoutView: View {
    
    @State var deliveryInstructionsText: String = ""
    
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                //topbar
                TopBarView(text: "Checkout")
                
                ScrollView(.vertical, showsIndicators: false) {
                    //delivery address
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Delivery Address")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text("Block P Phase 1 Johar Town, Lahoie")
                                    .font(.system(size: 17))
                                    .fontWeight(.regular)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            Button(action: {}, label: {
                                Image(systemName: "pencil")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 22, height: 22)
                                    .foregroundColor(.gray)
                            })
                        }
                        
                        Image("map")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 160)
                            .cornerRadius(16)
                    }
                    .frame(height: 280)
                    
                    //delivery instructions
                    VStack(alignment: .leading) {
                        Text("Delivery Instructions")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Text("Let us know if you have any specific things in mind")
                            .font(.system(size: 17))
                            .fontWeight(.regular)
                            .foregroundColor(.gray)
                        
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray)
                            .frame(height: 55)
                            .overlay(
                                TextField("e.g. I am home around 11pm", text: $deliveryInstructionsText)
                                    .padding()
                            )
                    }
                    .frame(height: 200)
                    
                    //payment method
                    VStack {
                        HStack {
                            Text("Payment Method")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Button(action: {}, label: {
                                Image(systemName: "plus")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.gray)
                            })
                        }
                        
                        //cards
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(userViewModel.paymentMethods) {payment in
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
                                                
                                                Text("\(String(payment.lastDigits))")
                                                    .font(.system(size: 22))
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.white)
                                            }
                                            .padding()
                                        })
                                        .overlay(alignment: .bottomLeading, content: {
                                            Text(payment.name)
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
                            }
                        }
                    }
                    
                    //order summary
                    VStack(spacing: 0) {
                        HStack {
                            Text("Order summary")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                        
                        ForEach(cartViewModel.cart.items) { item in
                            HStack {
                                Text("\(String(item.quantity))x \(String(item.food.name))")
                                    .font(.system(size: 17))
                                    .fontWeight(.regular)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Text("$\(String(format: "%.1f", item.food.price))")
                                    .font(.system(size: 17))
                                    .fontWeight(.regular)
                                    .foregroundColor(.gray)
                            }
                            .frame(height: 54)
                            
                            Divider()
                        }
                        
                        Divider()
                        
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
                        .frame(height: 54)
                        
                        Divider()
                        
                        HStack {
                            Text("Delivery Fee")
                                .font(.system(size: 17))
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Text("$10")
                                .font(.system(size: 17))
                                .fontWeight(.regular)
                                .foregroundColor(.gray)
                        }
                        .frame(height: 54)
                        
                        Divider()
                        
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
                        .frame(height: 54)
                        
                        Divider()
                        
                        HStack {
                            Text("Coupon")
                                .font(.system(size: 17))
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Text("-$4")
                                .font(.system(size: 17))
                                .fontWeight(.regular)
                                .foregroundColor(.green)
                        }
                        .frame(height: 54)
                    }
                    
                    //pay now
                    VStack {
                        HStack {
                           Text("$20")
                                .font(.system(size: 28))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            NavigationLink(destination: {
                                OrderCompleteView()
                                    .navigationBarTitle("")
                                    .navigationBarHidden(true)
                                    .navigationBarBackButtonHidden(true)
                            }, label: {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.pink)
                                    .frame(width: (UIScreen.main.bounds.width - Constants.defaultPadding/2) - 235, height: 55)
                                    .overlay(
                                        Text("Pay Now")
                                            .font(.system(size: 17))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                    )
                            })
                        }
                    }
                    .frame(height: 100)
                }
            }
            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
            .ignoresSafeArea(edges: .top)
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(UserViewModel())
            .environmentObject(CartViewModel())
    }
}
