//
//  RestaurantView.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 16.04.2022.
//

import SwiftUI

struct RestaurantView: View {
    
    let restaurant: Restaurant
    
    @State var categorySelected: FoodCategory
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                //top bar
                RestaurantTopBar(image: restaurant.image, title: restaurant.name, subtitle: restaurant.location)
                
                Rectangle()
                    .fill(.white)
                    .frame(width: UIScreen.main.bounds.width, height: 126)
                    .shadow(color: .black.opacity(0.08), radius: 24, x: 0, y: 8)
                    .overlay(
                        VStack(spacing: 25) {
                            //specifications
                            HStack(spacing: 95) {
                                VStack {
                                    Image(systemName: "star")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 24, height: 24)
                                    
                                    Text(String(format: "%.1f", restaurant.rating))
                                        .font(.system(size: 13))
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                }
                                
                                VStack {
                                    Image(systemName: "clock")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 24, height: 24)
                                    
                                    Text("\(String(format: "%.0f", restaurant.deliveryTime)) min")
                                        .font(.system(size: 13))
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                }
                                
                                VStack {
                                    Image(systemName: "location")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 24, height: 24)
                                    
                                    Text("\(String(format: "%.1f", restaurant.distance)) km")
                                        .font(.system(size: 13))
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                }
                            }
                            
                            //categories
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 24) {
                                    ForEach(restaurant.categories) { category in
                                        Button(action: {
                                            self.categorySelected = category
                                        }, label: {
                                            VStack {
                                                Text(category.name)
                                                    .font(.system(size: 15))
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(categorySelected == category ? .pink : .black)
                                                
                                                Rectangle()
                                                    .fill(categorySelected == category ? .pink : .clear)
                                                    .frame(height: 2)
                                            }
                                        })
                                    }
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)

                        }
                    )
                
                //foods
                ScrollView(.vertical, showsIndicators: false) {
                    ScrollViewReader { reader in
                        VStack {
                            ForEach(restaurant.categories) {category in
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(category.name)
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    ForEach(category.foods) { food in
                                        NavigationLink(destination: {
                                            FoodView(food: food)
                                                .navigationTitle("")
                                                .navigationBarHidden(true)
                                                .navigationBarBackButtonHidden(true)
                                        }, label: {
                                            HStack(spacing: 16) {
                                                Image(food.image)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 64, height: 64)
                                                    .clipped()
                                                    .cornerRadius(16)
                                                
                                                VStack(alignment: .leading, spacing: 12) {
                                                    VStack(alignment: .leading, spacing: 4) {
                                                        Text(food.name)
                                                            .font(.system(size: 17))
                                                            .fontWeight(.regular)
                                                            .foregroundColor(.black)
                                                        
                                                        Text(food.desc)
                                                            .font(.system(size: 15))
                                                            .fontWeight(.regular)
                                                            .foregroundColor(.gray)
                                                    }
                                                    
                                                    Text("$\(String(format: "%.1f", food.price))")
                                                        .font(.system(size: 15))
                                                        .fontWeight(.semibold)
                                                        .foregroundColor(.black)
                                                }
                                            }
                                        })
                                    }
                                }

                                .padding(.top)
                            }
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

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView(restaurant: restaurantsExamples[0], categorySelected: restaurantsExamples[0].categories[0])
    }
}
