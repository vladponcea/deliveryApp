//
//  TopBarView.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 19.04.2022.
//

import SwiftUI

struct TopBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let text: String
    
    var body: some View {
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
            
            Text(text)
                .font(.system(size: 17))
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - Constants.defaultPadding, height: 50)
        .padding(.top, 50)
    }
}

struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView(text: "Cart")
            .previewLayout(.sizeThatFits)
    }
}
