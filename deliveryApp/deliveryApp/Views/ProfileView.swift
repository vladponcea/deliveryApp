//
//  ProfileView.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 19.04.2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                VStack {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 88, height: 88)
                        .clipShape(Circle())
                    
                    Text("Vlad Poncea")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text("Rosiori de Vede, Teleorman")
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                }
                .padding(.top, 20)
                
                //account settings
                VStack(spacing: 0) {
                    HStack {
                        Text("Account Settings")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(.pink)
                        
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    
                    //edit account
                    NavigationLink(destination: {
                        EditProfile()
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true)
                    }, label: {
                        HStack(spacing: 15) {
                            Image(systemName: "person")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 22, height: 22)
                                .foregroundColor(.black)
                            
                            Text("Edit Account")
                                .font(.system(size: 17))
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 10, height: 10)
                                .foregroundColor(.black)
                        }
                        .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 55)
                        .padding(.horizontal)
                    })
                    .frame(width: UIScreen.main.bounds.width)
                    .background(.white)
                    
                    Divider()
                        .frame(width: UIScreen.main.bounds.width)
                    
                    //my locations
                    Button(action: {}, label: {
                        HStack(spacing: 15) {
                            Image(systemName: "mappin")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 10, height: 10)
                                .foregroundColor(.black)
                            
                            Text("My locations")
                                .font(.system(size: 17))
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 10, height: 10)
                                .foregroundColor(.black)
                        }
                        .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 55)
                        .padding(.horizontal)
                    })
                    .frame(width: UIScreen.main.bounds.width)
                    .background(.white)
                    
                    Divider()
                        .frame(width: UIScreen.main.bounds.width)
                    
                    //my orders
                    NavigationLink(destination: {
                        OrdersView()
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true)
                    }, label: {
                        HStack(spacing: 15) {
                            Image(systemName: "shippingbox")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 22, height: 22)
                                .foregroundColor(.black)
                            
                            Text("My orders")
                                .font(.system(size: 17))
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 10, height: 10)
                                .foregroundColor(.black)
                        }
                        .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 55)
                        .padding(.horizontal)
                    })
                    .frame(width: UIScreen.main.bounds.width)
                    .background(.white)
                    
                    Divider()
                        .frame(width: UIScreen.main.bounds.width)
                    
                    //payment methods
                    NavigationLink(destination: {
                        PaymentMethodView()
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true)
                    }, label: {
                        HStack(spacing: 15) {
                            Image(systemName: "creditcard")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 22, height: 22)
                                .foregroundColor(.black)
                            
                            Text("Payment methods")
                                .font(.system(size: 17))
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 10, height: 10)
                                .foregroundColor(.black)
                        }
                        .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 55)
                        .padding(.horizontal)
                    })
                    .frame(width: UIScreen.main.bounds.width)
                    .background(.white)
                    
                    Divider()
                        .frame(width: UIScreen.main.bounds.width)
                    
                    //my reviews
                    Button(action: {}, label: {
                        HStack(spacing: 15) {
                            Image(systemName: "star")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 22, height: 22)
                                .foregroundColor(.black)
                            
                            Text("My reviews")
                                .font(.system(size: 17))
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 10, height: 10)
                                .foregroundColor(.black)
                        }
                        .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 55)
                        .padding(.horizontal)
                    })
                    .frame(width: UIScreen.main.bounds.width)
                    .background(.white)
                    
                }
                
                //general settings
                VStack(spacing: 0) {
                    HStack {
                        Text("General Settings")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(.pink)
                        
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    
                    //about us
                    Button(action: {}, label: {
                        HStack(spacing: 15) {
                            Image(systemName: "info.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 22, height: 22)
                                .foregroundColor(.black)
                            
                            Text("About us")
                                .font(.system(size: 17))
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 10, height: 10)
                                .foregroundColor(.black)
                        }
                        .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 55)
                        .padding(.horizontal)
                    })
                    .frame(width: UIScreen.main.bounds.width)
                    .background(.white)
                    
                    Divider()
                        .frame(width: UIScreen.main.bounds.width)
                    
                    //data usage
                    Button(action: {}, label: {
                        HStack(spacing: 15) {
                            Image(systemName: "cylinder.split.1x2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                            
                            Text("Data usage")
                                .font(.system(size: 17))
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 10, height: 10)
                                .foregroundColor(.black)
                        }
                        .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 55)
                        .padding(.horizontal)
                    })
                    .frame(width: UIScreen.main.bounds.width)
                    .background(.white)
                    
                    
                }
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
