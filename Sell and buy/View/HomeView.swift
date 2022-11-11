//
//  HomeView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-29.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel : FirebaseViewModel
    
    let adaptiveColumns = [ GridItem(.flexible()),
                            GridItem(.flexible())]
    
    var body: some View {
        
        NavigationView {
            
            ZStack{
                LinearGradient.customGradient
                    .ignoresSafeArea()
                
                ScrollView (.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                        
                        ForEach(viewModel.userData) { user in
                            ForEach(user.items){ item in
                                NavigationLink(destination: DetailView( title: item.title, price: item.price, description: item.description,phoneNumber: item.phoneNumber, image: item.image))
                                { ItemView(title: item.title, price: item.price, image: item.image) }
                            }
                        }
                    }
                }
                .padding()
                
            }.navigationTitle("Home").font(Font.custom("Poppins-Medium", size: 20))
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.visible, for: .tabBar)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: FirebaseViewModel())
    }
}
