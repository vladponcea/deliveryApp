//
//  NotificationsView.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 20.04.2022.
//

import SwiftUI

struct NotificationsView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Notifications")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: UIScreen.main.bounds.height/10)
                
                ForEach(userViewModel.notifications) { notif in
                    Button(action: {
//                        notif.seen = true
                    }, label: {
                        VStack(alignment: .center, spacing: 0) {
                            HStack {
                                if(notif.seen == false) {
                                    Circle()
                                        .fill(.pink)
                                        .frame(width: 8, height: 8)
                                }
                                
                                Text(notif.text)
                                    .font(.system(size: 17))
                                    .fontWeight(.regular)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Text(notif.time)
                                    .font(.system(size: 17))
                                    .fontWeight(.regular)
                                    .foregroundColor(.gray)
                            }
                            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 55)
                            
                            Divider()
                                .frame(width: UIScreen.main.bounds.width)
                        }
                    })
                }
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding)
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
            .environmentObject(UserViewModel())
    }
}
