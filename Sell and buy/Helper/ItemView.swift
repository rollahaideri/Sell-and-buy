//
//  ItemView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-29.
//

import SwiftUI


// A card/itemView for the LazyVStack in the HomeView

struct ItemView: View {
    
    var title: String
    var price: String
    var image: String?
    @State var isLoading = true
    
    
    var body: some View {
        
        VStack (alignment: .leading){
            AsyncImage(url: URL(string: image ?? ""), content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: 150, minHeight: 0, maxHeight: 100)
            }, placeholder: {
                ShimmerView()
            })
            
            .cornerRadius(14)
            .overlay(RoundedRectangle(cornerRadius: 14)
                .stroke(Color("Border-Btn"), lineWidth: 2))
            
            Text(title ).font(Font.custom("Poppins-Medium", size: 15)).foregroundColor(.primary)
            Text(price + " Kr").font(.itemPrice).foregroundColor(Color("Border-Btn"))
            
        }.frame(minWidth: 0, maxWidth: 200,minHeight: 0, maxHeight: 170)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isLoading = false
                }
            }
            .redacted( reason: isLoading ? .placeholder : [])
        
    }
    
    
}


struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(title: "", price: "")
    }
}
