//
//  HomeView.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 15.04.2022.
//

import SwiftUI

struct HomeView: View {
    
    @State var searchText: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .fill(.pink)
                    .frame(width: UIScreen.main.bounds.width, height: 170)
                    .overlay(alignment: .bottom, content: {
                        VStack {
                            HStack {
                                Image(systemName: "mappin.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 22, height: 22)
                                    .foregroundColor(.white)
                                
                                
                                Text("Dunarii 51, Rosiori de Vede")
                                    .font(.system(size: 17))
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                                
                            }
                            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
                            
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.white)
                                .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 54)
                                .overlay(
                                    HStack {
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(.gray)
                                        
                                        TextField("Search...", text: $searchText)
                                    }
                                        .padding()
                                )
                        }
                        .padding()
                    })
                    .ignoresSafeArea(edges: .top)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        Image("food1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 160)
                            .clipped()
                            .cornerRadius(16)
                            .shadow(radius: 5)
                            .overlay(
                                ZStack(alignment: .bottomLeading) {
                                    LinearGradient(colors: [.clear, .black.opacity(0.5)], startPoint: .top, endPoint: .bottom)
                                        .cornerRadius(16)
                                    
                                    VStack(alignment: .leading) {
                                        Text("Food")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                        Text("Order food you love")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                }
                            )
                        
                        HStack(spacing: 16) {
                            Image("food2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: (UIScreen.main.bounds.width - 64) / 2,height: 160)
                                .clipped()
                                .cornerRadius(16)
                                .shadow(radius: 5)
                                .overlay(
                                    ZStack(alignment: .bottomLeading) {
                                        LinearGradient(colors: [.clear, .black.opacity(0.5)], startPoint: .top, endPoint: .bottom)
                                            .cornerRadius(16)
                                        
                                        VStack(alignment: .leading) {
                                            Text("Food")
                                                .font(.title3)
                                                .foregroundColor(.white)
                                            Text("Order food you love")
                                                .font(.caption)
                                                .foregroundColor(.white)
                                        }
                                        .padding()
                                    }
                                )
                            
                            Image("food1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: (UIScreen.main.bounds.width - 64) / 2,height: 160)
                                .clipped()
                                .cornerRadius(16)
                                .shadow(radius: 5)
                                .overlay(
                                    ZStack(alignment: .bottomLeading) {
                                        LinearGradient(colors: [.clear, .black.opacity(0.5)], startPoint: .top, endPoint: .bottom)
                                            .cornerRadius(16)
                                        
                                        VStack(alignment: .leading) {
                                            Text("Food")
                                                .font(.title3)
                                                .foregroundColor(.white)
                                            Text("Order food you love")
                                                .font(.caption)
                                                .foregroundColor(.white)
                                        }
                                        .padding()
                                    }
                                )
                        }
                        
                    }
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            FoodCardView(image: "food4", text: "Food", description: "Order food you love")
                            
                            FoodCardView(image: "food2", text: "Food", description: "Order food you love")
                            
                            FoodCardView(image: "food1", text: "Food", description: "Order food you love")
                        }
                    }
                    .padding()
                    
                    Button(action: {}, label: {
                        HStack {
                            Text("Deals")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 10, height: 10)
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal)
                    })
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            DealsCardView(image: "food1", deliveryTime: 40, restaurantName: "Daily Deli", rating: 4.8, location: "Johar Town")
                            
                            DealsCardView(image: "food4", deliveryTime: 40, restaurantName: "Daily Deli", rating: 4.8, location: "Johar Town")
                            
                            DealsCardView(image: "food2", deliveryTime: 40, restaurantName: "Daily Deli", rating: 4.8, location: "Johar Town")
                            
                            DealsCardView(image: "food1", deliveryTime: 40, restaurantName: "Daily Deli", rating: 4.8, location: "Johar Town")
                        }
                    }
                    .padding(.horizontal)
                    
                    Button(action: {}, label: {
                        HStack {
                            Text("Explore More")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                    })
                    .padding(.horizontal)
                    .padding(.top, 30)
                    
                    VStack {
                        ExploreMoreCardView(image: "food1", deliveryTime: 40, restaurantName: "Jean's Cakes", location: "Bucurestii noi", rating: 4.8)
                        
                        ExploreMoreCardView(image: "food3", deliveryTime: 30, restaurantName: "Jean's Cakes", location: "Bucurestii noi", rating: 4.7)
                        
                        ExploreMoreCardView(image: "food2", deliveryTime: 25, restaurantName: "Jean's Cakes", location: "Bucurestii noi", rating: 4.3)
                        
                        ExploreMoreCardView(image: "food4", deliveryTime: 70, restaurantName: "Jean's Cakes", location: "Bucurestii noi", rating: 3.7)
                    }
                    .padding(.horizontal)
                }
                .offset(y: -(UIScreen.main.bounds.height / 20))
                .ignoresSafeArea()
            }
            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct FoodCardView: View {
    
    let image: String
    let text: String
    let description: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding ,height: 160)
            .clipped()
            .cornerRadius(16)
            .overlay(
                ZStack(alignment: .bottomLeading) {
                    LinearGradient(colors: [.clear, .black.opacity(0.5)], startPoint: .top, endPoint: .bottom)
                        .cornerRadius(16)
                    
                    VStack(alignment: .leading) {
                        Text(text)
                            .font(.title3)
                            .foregroundColor(.white)
                        Text(description)
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    .padding()
                }
            )
    }
}

struct DealsCardView: View {
    
    let image: String
    let deliveryTime: Int
    let restaurantName: String
    let rating: Double
    let location: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 120, height: 160)
                .clipped()
                .cornerRadius(16)
                .overlay(alignment: .bottomLeading, content: {
                    RoundedRectangle(cornerRadius: 800)
                        .fill(.white)
                        .frame(width: 57, height: 24)
                        .overlay(
                            Text("\(deliveryTime) min")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        )
                        .padding()
                })
            
            HStack {
                Text(restaurantName)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Spacer()
                
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 18, height: 18)
                        .foregroundColor(.yellow)
                    
                    Text(String(format: "%.1f", rating))
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
            }
            
            Text(location)
                .font(.system(size: 15))
                .fontWeight(.regular)
                .foregroundColor(.gray)
        }
    }
}

struct ExploreMoreCardView: View {
    
    let image: String
    let deliveryTime: Int
    let restaurantName: String
    let location: String
    let rating: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding ,height: 160)
                .clipped()
                .cornerRadius(16)
                .overlay(alignment: .bottomLeading, content: {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.white)
                        .frame(width: 57, height: 24)
                        .overlay(
                            Text("\(deliveryTime) min")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        )
                        .padding()
                })
                .overlay(alignment: .topTrailing, content: {
                    Button(action: {}, label: {
                        Circle()
                            .fill(.gray.opacity(0.8))
                            .frame(width: 24, height: 24)
                            .overlay(
                                Image(systemName: "heart")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.white)
                            )
                            .padding(10)
                    })
                })
            
            HStack {
                Text(restaurantName)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Spacer()
                
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 18, height: 18)
                        .foregroundColor(.yellow)
                    
                    Text(String(format: "%.1f", rating))
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
            }
            
            Text(location)
                .font(.system(size: 15))
                .fontWeight(.regular)
                .foregroundColor(.gray)
        }
    }
}
