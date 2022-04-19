//
//  CartView.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 19.04.2022.
//

import SwiftUI

struct CartView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var viewModel: CartViewModel
    
    @State var couponText: String = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                //topbar
                HStack(spacing: 12) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 10, height: 10)
                            .foregroundColor(.black)
                    })
                    
                    Text("Cart")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .frame(height: 50)
                .padding(.top, 50)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        //items
                        ForEach(viewModel.cart.items) {item in
                            VStack(spacing: 0) {
                                HStack {
                                    Image(item.food.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 64, height: 64)
                                        .cornerRadius(16)
                                        .overlay(alignment: .topTrailing, content: {
                                            Circle()
                                                .fill(.black)
                                                .frame(width: 20, height: 20)
                                                .overlay(
                                                    Text("\(item.quantity)")
                                                        .font(.system(size: 12))
                                                        .fontWeight(.regular)
                                                        .foregroundColor(.white)
                                                )
                                                .padding(-5)
                                        })
                                    
                                    VStack(alignment: .leading, spacing: 12) {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text(item.food.name)
                                                .font(.system(size: 17))
                                                .fontWeight(.regular)
                                                .foregroundColor(.black)
                                            
                                            Text(item.food.desc)
                                                .font(.system(size: 15))
                                                .fontWeight(.regular)
                                                .foregroundColor(.gray)
                                        }
                                        
                                        Text("$\(String(format: "%.1f", item.food.price))")
                                            .font(.system(size: 15))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {}, label: {
                                        Image(systemName: "x.circle.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 17, height: 17)
                                            .foregroundColor(.gray)
                                    })
                                }
                                .frame(height: 110)
                                
                                Divider()
                            }
                        }
                        
                        //suggestions
                        VStack {
                            HStack {
                                Text("Popular with these")
                                    .font(.system(size: 17))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(foodExamples) {food in
                                        VStack(alignment: .leading) {
                                            Image(food.image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 240, height: 160)
                                                .cornerRadius(16)
                                                .overlay(alignment: .bottomLeading, content: {
                                                    RoundedRectangle(cornerRadius: 800)
                                                        .fill(.white)
                                                        .frame(width: 38, height: 24)
                                                        .overlay(
                                                            Text("$\(String(format: "%.1f", food.price))")
                                                                .font(.system(size: 12))
                                                                .fontWeight(.regular)
                                                                .foregroundColor(.black)
                                                        )
                                                        .padding(5)
                                                })
                                            
                                            HStack {
                                                Text(food.name)
                                                    .font(.system(size: 17))
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(.black)
                                                
                                                Spacer()
                                                
                                                Button(action: {}, label: {
                                                    Image(systemName: "plus")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        .frame(width: 18, height: 18)
                                                        .foregroundColor(.gray)
                                                })
                                            }
                                            
                                            Text(food.desc)
                                                .font(.system(size: 15))
                                                .fontWeight(.regular)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            }
                        }
                        .frame(height: 300)
                        
                        //coupon code
                        VStack {
                            HStack {
                                Text("Coupon")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray)
                                .frame(height: 54)
                                .overlay(
                                    HStack {
                                        TextField("Enter a coupon code...", text: $couponText)
                                        
                                        Button(action: {}, label: {
                                            Image(systemName: "chevron.right")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 10, height: 10)
                                                .foregroundColor(.gray)
                                        })
                                    }
                                        .padding()
                                )
                            
                        }
                        .frame(height: 140)
                        
                        //subtotal
                        VStack(spacing: 0) {
                            HStack {
                                Text("Subtotal")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Text("$50")
                                    .font(.system(size: 17))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.pink)
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
                        
                        //checkout
                        VStack {
                            HStack {
                                Text("$20")
                                    .font(.system(size: 28))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Button(action: {}, label: {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(.pink)
                                        .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding - 155, height: 55)
                                        .overlay(
                                            Text("Go to Checkout")
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
                
                
            }
            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
            .ignoresSafeArea(edges: .top)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartViewModel())
    }
}
