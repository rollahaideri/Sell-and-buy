//
//  HomeView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-29.
//

import SwiftUI

struct HomeView: View {
    
    
    
    @ObservedObject var viewModel : FirebaseViewModel
   
    
    @State  var searchText = ""
     let adaptiveColumns = [ GridItem(.adaptive(minimum: 120))]
    
    
    var body: some View {
        
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("Background-Start"),Color("Background-End")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                ScrollView{
                    
                    if let userData = viewModel.userData{
                        ForEach(userData) { datum in
                            
                            
                            LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                                
                                ForEach($viewModel.userData) {
                                    user in
                                    NavigationLink(destination: DetailView( title: user.title, price: user.price, description: user.description, image: user.image))
                                    {ItemView(title: user.title, price: user.price, image: user.image)
                                    }
                                    
                                    
                                    //                                                    ForEach(searchResults, id: \.self) { name in
                                    //                                        NavigationLink(destination: Text(name)) {
                                    //                                            Text(name)
                                    //                                        }
                                    
                                    
                                }
                            }
                        }
                       
                }
                    
                }
                .padding()
                .searchable(text: $searchText)
                
                
            }
        }
        
    }
//        var searchResults: [] {
//            if searchText.isEmpty {
//                return viewModel.userData
//            } else {
//                return names.filter { $0.contains(searchText) }
//            }
//        }
}


// Item View




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: FirebaseViewModel())
    }
}
