//
//  RestaurantTopBarView.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 18.04.2022.
//

import SwiftUI

struct RestaurantTopBar: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let image: String
    let title: String
    let subtitle: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width, height: 200)
            .clipped()
            .overlay(content: {
                ZStack(alignment: .top) {
                    LinearGradient(colors: [.black, .black.opacity(0.3)], startPoint: .top, endPoint: .bottom)
                    
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "chevron.left")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 10, height: 10)
                        })
                        
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
                    Text(title)
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(subtitle)
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                }
                .padding(.leading, 24)
                .padding(.bottom)
            })
    }
}

struct RestaurantTopBarView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantTopBar(image: "food1", title: "Daily Deli", subtitle: "Johar Town")
            .previewLayout(.sizeThatFits)
    }
}
