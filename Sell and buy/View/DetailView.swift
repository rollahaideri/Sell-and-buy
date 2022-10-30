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
    var body: some View {
        ZStack (){
            LinearGradient(gradient: Gradient(colors: [Color("Background-Start"),Color("Background-End")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            
            
            
            ScrollView{
                VStack(alignment: .leading, spacing: 10){
                    Image("iPhone")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    VStack(alignment: .leading, spacing: 10){
                        Text(title).font(.pageSubTitle).foregroundColor(.white)
                        Text(price).font(.pageSubTitle).foregroundColor(Color("Border-Btn"))
                        Text(description).font(.pageSubTitle).foregroundColor(.white)
                        
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
        DetailView(title: "", price: "", description: "")
    }
}
