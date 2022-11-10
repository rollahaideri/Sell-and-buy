//
//  DetailView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-29.
//

import SwiftUI

struct DetailView: View {
    
    var title: String
    var price: String
    var description: String
    var phoneNumber: String
    var image: String?
    
    
    var body: some View {
        
        ZStack (){
            LinearGradient.customGradient
                .ignoresSafeArea()
            
            
            ScrollView (.vertical){
                VStack(alignment: .leading){
                    AsyncImage(url: URL(string: image ?? ""), content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: 300)
                            
                    }, placeholder: {
                        Image(systemName: "photo.artframe")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: 300)
                        
                    })
                    VStack(alignment: .leading, spacing: 10){
                        Text(title).font(.pageTitle)
                        Text(price + " Kr").font(Font.custom("Poppins-Medium", size: 20)).foregroundColor(Color("Border-Btn"))
                        Divider()
                        Text(phoneNumber)
                        Divider()
                        Text("Description").font(Font.custom("Poppins-Medium", size: 22))
                        Text(description).font(.pageSubTitle)
                        
                        
                    }.padding()
                    
                }
                    
                
            }
            
        }.navigationTitle("Items Detail")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(title: "", price: "", description: "", phoneNumber: "", image: "")
    }
}
