//
//  ItemView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-29.
//

import SwiftUI

struct ItemView: View {
    var body: some View {
        VStack (alignment: .leading){
            
            
            Image("iPhone")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(14)
                .overlay(RoundedRectangle(cornerRadius: 14)
                    .stroke(Color("Border-Btn"), lineWidth: 2))
            
            Text("Iphone 14").font(.itemTitle).foregroundColor(.white)
            Text("5000 Kr").font(.itemPrice).foregroundColor(Color("Border-Btn"))
        }
        .frame(width: 200, height: 170)
        
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
