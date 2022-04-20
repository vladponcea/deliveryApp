//
//  SavedView.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 20.04.2022.
//

import SwiftUI

struct SavedView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Saved (3)")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.bottom, 10)
                .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: UIScreen.main.bounds.height/10)
                
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(userViewModel.savedRestaurants) {restaurant in
                        VStack(alignment: .leading, spacing: 4) {
                            Image(restaurant.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 160)
                                .cornerRadius(16)
                                .overlay(alignment: .bottomLeading, content: {
                                    RoundedRectangle(cornerRadius: 800)
                                        .fill(.white)
                                        .frame(width: 57, height: 24)
                                        .overlay(
                                            Text("\(String(format: "%.0f", restaurant.deliveryTime)) min")
                                                .font(.system(size: 12))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.black)
                                        )
                                        .padding(10)
                                })
                            
                            HStack {
                                Text(restaurant.name)
                                    .font(.system(size: 17))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                HStack(spacing: 5) {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(.yellow)
                                    
                                    Text("\(String(format: "%.1f", restaurant.rating))")
                                        .font(.system(size: 13))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                }
                            }
                            
                            Text(restaurant.location)
                                .font(.system(size: 15))
                                .fontWeight(.regular)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
        }
    }
}

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
            .environmentObject(UserViewModel())
    }
}
