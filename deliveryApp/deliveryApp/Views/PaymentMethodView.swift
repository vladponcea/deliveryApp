//
//  PaymentMethodView.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 20.04.2022.
//

import SwiftUI

struct PaymentMethodView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State var cardNameText: String = "Vlad Poncea"
    @State var cardNumberText: String = "1234 1234 1234 1234"
    @State var expiryDateText: String = "02/2023"
    @State var cvvText: String = "456"
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 25) {
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
                    
                    Text("Payment Method")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 22, height: 22)
                            .foregroundColor(.gray)
                    })
                }
                .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
                .frame(width: UIScreen.main.bounds.width, height: 50)
                .padding(.top, 50)
                
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(userViewModel.paymentMethods) { payment in
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
                .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
                
                //inputs
                VStack {
                    //username
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray)
                        .frame(height: 75)
                        .overlay(
                            VStack(alignment: .leading) {
                                Text("Card Name")
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                                    .foregroundColor(.gray)
                                
                                TextField("", text: $cardNameText)
                            }
                                .padding()
                        )
                    
                    //cardNumber
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray)
                        .frame(height: 75)
                        .overlay(
                            VStack(alignment: .leading) {
                                Text("Card Number")
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                                    .foregroundColor(.gray)
                                
                                TextField("", text: $cardNumberText)
                            }
                                .padding()
                        )
                    
                    //expiry date
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray)
                        .frame(height: 75)
                        .overlay(
                            VStack(alignment: .leading) {
                                Text("Expiry Date")
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                                    .foregroundColor(.gray)
                                
                                TextField("", text: $expiryDateText)
                            }
                                .padding()
                        )
                    
                    //cvv
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray)
                        .frame(height: 75)
                        .overlay(
                            VStack(alignment: .leading) {
                                Text("CVV")
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                                    .foregroundColor(.gray)
                                
                                TextField("", text: $cvvText)
                            }
                                .padding()
                        )
                    
                    
                }
                .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
            .ignoresSafeArea(edges: .top)
        }
    }
}

struct PaymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodView()
            .environmentObject(UserViewModel())
    }
}
