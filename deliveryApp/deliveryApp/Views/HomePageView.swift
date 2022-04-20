//
//  HomePageView.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 20.04.2022.
//

import SwiftUI

struct HomePageView: View {
    
    let tabs: [String] = ["Explore", "Saved", "Notifications", "Profile"]
    
    @State var selectedTab = "Explore"
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                VStack(spacing: 0) {
                    switch selectedTab {
                    case "Explore":
                        HomeView()
                    case "Saved":
                        SavedView()
                    case "Notifications":
                        NotificationsView()
                    case "Profile":
                        ProfileView()
                    default:
                        HomeView()
                    }
                    
                    Rectangle()
                        .fill(.white)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/10)
                        .overlay(
                            HStack {
                                Button(action: {
                                    selectedTab = "Explore"
                                }, label: {
                                    VStack {
                                        Image(systemName: "magnifyingglass")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 20, height: 20)
                                        
                                        Text("Explore")
                                            .font(.system(size: 11))
                                            .fontWeight(.regular)
                                    }
                                    .foregroundColor(.gray)
                                })
                                
                                Spacer()
                                
                                Button(action: {
                                    selectedTab = "Saved"
                                }, label: {
                                    VStack {
                                        Image(systemName: "heart")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 20, height: 20)
                                        
                                        Text("Saved")
                                            .font(.system(size: 11))
                                            .fontWeight(.regular)
                                    }
                                    .foregroundColor(.gray)
                                })
                                
                                Spacer()
                                
                                Button(action: {
                                    selectedTab = "Notifications"
                                }, label: {
                                    VStack {
                                        Image(systemName: "bell")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 20, height: 20)
                                        
                                        Text("Notifications")
                                            .font(.system(size: 11))
                                            .fontWeight(.regular)
                                    }
                                    .foregroundColor(.gray)
                                })
                                
                                Spacer()
                                
                                Button(action: {
                                    selectedTab = "Profile"
                                }, label: {
                                    VStack {
                                        Image(systemName: "person")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 20, height: 20)
                                        
                                        Text("Profile")
                                            .font(.system(size: 11))
                                            .fontWeight(.regular)
                                    }
                                    .foregroundColor(.gray)
                                })
                            }
                                .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
                        )
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .ignoresSafeArea(edges: .bottom)
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .environmentObject(UserViewModel())
            .environmentObject(CartViewModel())
    }
}
