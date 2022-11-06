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
    var image: String?
    var body: some View {
        ZStack (){
            LinearGradient(gradient: Gradient(colors: [Color("Background-Start"),Color("Background-End")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            
            
            
            ScrollView{
                VStack(alignment: .leading, spacing: 10){
                    AsyncImage(url: URL(string: image ?? ""), content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width, height: 300)
                            
                    }, placeholder: {
                        Image(systemName: "photo.artframe")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: 300)
                        
                            
                    })
                    VStack(alignment: .leading, spacing: 10){
                        Text(title).font(.pageSubTitle)
                        Text(price).font(.pageSubTitle).foregroundColor(Color("Border-Btn"))
                        Text(description).font(.pageSubTitle)
                        
                        Button {
                            print("Call")
                        } label: {
                            Text("072302020202")
                                .foregroundColor(.white)
                        }
                        
                    }.padding()
                    
                }
                
            }
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(title: "", price: "", description: "", image: "")
    }
}
