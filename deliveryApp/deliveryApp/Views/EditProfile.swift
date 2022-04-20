//
//  EditProfile.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 20.04.2022.
//

import SwiftUI

struct EditProfile: View {
    
    @State var userName: String = "Vlad Poncea"
    @State var email: String = "contact@vladponcea.com"
    @State var phone: String = "+40790387080"
    @State var pass: String = "test1234unsparu"
    
    @State var showPass: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                TopBarView(text: "Edit Account")
                
                VStack(spacing: 40) {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(alignment: .bottomTrailing, content: {
                            Button(action: {}, label: {
                                Circle()
                                    .fill(.pink)
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        Image(systemName: "camera")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 15, height: 15)
                                            .foregroundColor(.white)
                                    )
                            })
                        })
                    
                    //inputs
                    VStack(spacing: 16) {
                        //username
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray)
                            .frame(height: 75)
                            .overlay(
                                VStack(alignment: .leading) {
                                    Text("Name")
                                        .font(.system(size: 12))
                                        .fontWeight(.regular)
                                        .foregroundColor(.gray)
                                    
                                    TextField("", text: $userName)
                                }
                                    .padding()
                            )
                        
                        //email
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray)
                            .frame(height: 75)
                            .overlay(
                                VStack(alignment: .leading) {
                                    Text("Email")
                                        .font(.system(size: 12))
                                        .fontWeight(.regular)
                                        .foregroundColor(.gray)
                                    
                                    TextField("", text: $email)
                                }
                                    .padding()
                            )
                        
                        //phone
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray)
                            .frame(height: 75)
                            .overlay(
                                VStack(alignment: .leading) {
                                    Text("Phone No.")
                                        .font(.system(size: 12))
                                        .fontWeight(.regular)
                                        .foregroundColor(.gray)
                                    
                                    TextField("", text: $phone)
                                }
                                    .padding()
                            )
                        
                        //pass
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray)
                            .frame(height: 75)
                            .overlay(
                                VStack(alignment: .leading) {
                                    Text("Password")
                                        .font(.system(size: 12))
                                        .fontWeight(.regular)
                                        .foregroundColor(.gray)
                                    
                                    HStack {
                                        if showPass {
                                            TextField("", text: $pass)
                                        } else {
                                            SecureField("", text: $pass)
                                        }
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            self.showPass.toggle()
                                        }, label: {
                                            Image(systemName: "eye")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 15, height: 15)
                                                .foregroundColor(.gray)
                                        })
                                    }
                                }
                                    .padding()
                            )
                    }
                    
                    //save button
                    Button(action: {
                        
                    }, label: {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.pink)
                            .frame(height: 60)
                            .overlay(
                                Text("Save")
                                    .font(.system(size: 17))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            )
                    })
                }
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
            .ignoresSafeArea(edges: .top)
        }
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
