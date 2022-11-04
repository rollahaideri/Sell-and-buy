//
//  ItemView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-29.
//

import SwiftUI

struct ItemView: View {
    
     var title: String
     var price: String
    var image: String?
    
    
    var body: some View {
        VStack (alignment: .leading){
           
            
            AsyncImage(url: URL(string: image ?? ""), content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }, placeholder: {
                Color.gray
            })
                    
                    
            
                        
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(14)
                        .overlay(RoundedRectangle(cornerRadius: 14)
                            .stroke(Color("Border-Btn"), lineWidth: 2))
                    
                    Text(title).font(.itemTitle).foregroundColor(.white)
                    Text(price).font(.itemPrice).foregroundColor(Color("Border-Btn"))
                
            }.frame(width: 200, height: 170)
            
        }
        
        
    }


struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(title: "", price: "")
    }
}
