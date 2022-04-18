//
//  FoodView.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 18.04.2022.
//

import SwiftUI

struct FoodView: View {
    
    @State var instructionsText: String = ""
    @State var quantity: Int = 1
    @State var selectedVariation: Extra = Extra(name: "8\"", price: 10)
    @State var selectedExtra: Extra = Extra(name: "Texas Barbeque", price: 6)
    let food: Food
    
    var body: some View {
        ZStack {
            VStack(spacing: 25) {
                RestaurantTopBar(image: "food2", title: "Chicken Fajita Pizza", subtitle: "Daily Deli")
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 25) {
                        //variation
                        VStack {
                            HStack {
                                Text("Variation")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Text("Required")
                                    .font(.system(size: 17))
                                    .fontWeight(.regular)
                                    .foregroundColor(.pink)
                            }
                            
                            ForEach(food.variations) {variation in
                                VStack(spacing: 0) {
                                    Button(action: {
                                        selectedVariation = variation
                                    }, label: {
                                        HStack {
                                            Circle()
                                                .stroke(selectedVariation == variation ? .pink : .gray)
                                                .frame(width: 19, height: 19)
                                            
                                            Text(variation.name)
                                                .font(.system(size: 17))
                                                .fontWeight(.regular)
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                            
                                            Text("$\(String(format: "%.1f", variation.price))")
                                                .font(.system(size: 17))
                                                .fontWeight(.regular)
                                                .foregroundColor(.gray)
                                        }
                                        .frame(height: 55)
                                    })
                                    
                                    Divider()
                                }
                            }
                        }
                        
                        //quantity
                        VStack {
                            HStack {
                                Text("Quantity")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Text("Required")
                                    .font(.system(size: 17))
                                    .fontWeight(.regular)
                                    .foregroundColor(.pink)
                            }
                            
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray)
                                .frame(height: 54)
                                .overlay(
                                    HStack {
                                        Button(action: {
                                            if(quantity > 0){
                                                quantity -= 1
                                            }
                                        }, label: {
                                            Image(systemName: "minus")
                                                .foregroundColor(.gray)
                                        })
                                        
                                        Spacer()
                                        
                                        Text("\(quantity)")
                                            .font(.system(size: 17))
                                            .fontWeight(.regular)
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            if(quantity >= 0){
                                                quantity += 1
                                            }
                                        }, label: {
                                            Image(systemName: "plus")
                                                .foregroundColor(.gray)
                                        })
                                    }
                                        .padding()
                                )
                        }
                        
                        //extra
                        VStack {
                            HStack {
                                Text("Extra Sauce")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            
                            ForEach(food.extras){ extra in
                                VStack(spacing: 0) {
                                    Button(action: {
                                        selectedExtra = extra
                                    }, label: {
                                        HStack {
                                            Circle()
                                                .stroke(selectedExtra == extra ? .pink : .gray)
                                                .frame(width: 19, height: 19)
                                            
                                            Text(extra.name)
                                                .font(.system(size: 17))
                                                .fontWeight(.regular)
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                            
                                            Text("+$\(String(format: "%.1f", extra.price))")
                                                .font(.system(size: 17))
                                                .fontWeight(.regular)
                                                .foregroundColor(.gray)
                                        }
                                        .frame(height: 55)
                                    })
                                    
                                    Divider()
                                }
                            }
                        }
                        
                        //instructions
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Instructions")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            
                            Text("Let us know if you have specific things in mind")
                                .font(.system(size: 17))
                                .fontWeight(.regular)
                                .foregroundColor(.gray)
                            
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray)
                                .frame(height: 54)
                                .overlay(
                                    TextField("e.g. less spices, no mayo, etc.", text: $instructionsText)
                                        .padding()
                                )
                        }
                        
                        //if product not available
                        VStack {
                            HStack {
                                Text("If the product is not available")
                                    .font(.system(size: 17))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray)
                                .frame(height: 54)
                                .overlay(
                                    HStack {
                                        Text("Remove it from my order")
                                            .font(.system(size: 17))
                                            .fontWeight(.regular)
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.down")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 10, height: 10)
                                            .foregroundColor(.gray)
                                    }
                                        .padding()
                                )
                        }
                        .padding(.bottom, 90)
                        
                        //add to cart
                        HStack {
                            Text("$20")
                                .font(.system(size: 28))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Button(action: {}, label: {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.pink)
                                    .frame(width: (UIScreen.main.bounds.width - Constants.defaultPadding/2) - 240, height: 54)
                                    .overlay(
                                        Text("Add to cart")
                                            .font(.system(size: 17))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                    )
                            })
                        }
                    }
                    
                }
                
            }
            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
            .ignoresSafeArea(edges: .top)
        }
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(food: foodExamples[0])
    }
}
