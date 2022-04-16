//
//  RestaurantView.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 16.04.2022.
//

import SwiftUI

struct RestaurantView: View {
    
    let categories: [String] = ["Popular", "Deals", "Wraps", "Beverages", "Sandwiches"]
    @State var categorySelected: String = "Popular"
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                //top bar
                Image("food1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 200)
                    .clipped()
                    .overlay(content: {
                        ZStack(alignment: .top) {
                            LinearGradient(colors: [.black, .black.opacity(0.3)], startPoint: .top, endPoint: .bottom)
                            
                            HStack {
                                Image(systemName: "chevron.left")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 10, height: 10)
                                
                                Spacer()
                                
                                HStack(spacing: 16) {
                                    Button(action: {}, label: {
                                        Image(systemName: "heart")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 22, height: 22)
                                    })
                                    
                                    Button(action: {}, label: {
                                        Image(systemName: "square.and.arrow.up")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 22, height: 22)
                                    })
                                    
                                    Button(action: {}, label: {
                                        Image(systemName: "ellipsis")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 5, height: 5)
                                            .rotationEffect(Angle(degrees: 90))
                                    })
                                }
                            }
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
                            .padding(.top, 50)
                        }
                    })
                    .overlay(alignment: .bottomLeading, content: {
                        VStack(alignment: .leading) {
                            Text("Daily Deli")
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("Johar Town")
                                .font(.system(size: 15))
                                .fontWeight(.regular)
                                .foregroundColor(.white)
                        }
                        .padding(.leading, 24)
                        .padding(.bottom)
                    })
                
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
                                    
                                    Text("4.8")
                                        .font(.system(size: 13))
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                }
                                
                                VStack {
                                    Image(systemName: "clock")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 24, height: 24)
                                    
                                    Text("40 min")
                                        .font(.system(size: 13))
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                }
                                
                                VStack {
                                    Image(systemName: "location")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 24, height: 24)
                                    
                                    Text("1.4 km")
                                        .font(.system(size: 13))
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                }
                            }
                            
                            //categories
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 24) {
                                    ForEach(categories, id: \.self) { name in
                                        Button(action: {
                                            self.categorySelected = name
                                        }, label: {
                                            VStack {
                                                Text(name)
                                                    .font(.system(size: 15))
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(categorySelected == name ? .pink : .black)
                                                
                                                Rectangle()
                                                    .fill(categorySelected == name ? .pink : .clear)
                                                    .frame(height: 2)
                                            }
                                        })
                                    }
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)

                        }
                    )
                
                ScrollView(.vertical, showsIndicators: false) {
                    ScrollViewReader { reader in
                        VStack {
                            ForEach(categories, id: \.self) {name in
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(name)
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack(spacing: 16) {
                                        Image("food2")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 64, height: 64)
                                            .clipped()
                                            .cornerRadius(16)
                                        
                                        VStack(alignment: .leading, spacing: 12) {
                                            VStack(alignment: .leading, spacing: 4) {
                                                Text("Chicken Fajita Pizza")
                                                    .font(.system(size: 17))
                                                    .fontWeight(.regular)
                                                    .foregroundColor(.black)
                                                
                                                Text("8\" pizza with regular soft drink")
                                                    .font(.system(size: 15))
                                                    .fontWeight(.regular)
                                                    .foregroundColor(.gray)
                                            }
                                            
                                            Text("$10")
                                                .font(.system(size: 15))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.black)
                                        }
                                    }
                                    
                                    HStack(spacing: 16) {
                                        Image("food3")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 64, height: 64)
                                            .clipped()
                                            .cornerRadius(16)
                                        
                                        VStack(alignment: .leading, spacing: 12) {
                                            VStack(alignment: .leading, spacing: 4) {
                                                Text("Chicken Fajita Pizza")
                                                    .font(.system(size: 17))
                                                    .fontWeight(.regular)
                                                    .foregroundColor(.black)
                                                
                                                Text("8\" pizza with regular soft drink")
                                                    .font(.system(size: 15))
                                                    .fontWeight(.regular)
                                                    .foregroundColor(.gray)
                                            }
                                            
                                            Text("$10")
                                                .font(.system(size: 15))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.black)
                                        }
                                    }
                                }
                                .id(name)
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
        RestaurantView()
    }
}
