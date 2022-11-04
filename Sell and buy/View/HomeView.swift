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
     let adaptiveColumns = [ GridItem(.adaptive(minimum: 140))]
    
    
    var body: some View {
        
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("Background-Start"),Color("Background-End")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                ScrollView{
                    
                    LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                        ForEach(viewModel.userData) { user in
                            ForEach(user.items){ item in
                                NavigationLink(destination: DetailView( title: item.title, price: item.price, description: item.description, image: item.image))
                                { ItemView(title: item.title, price: item.price, image: item.image) }
                            }
                            
                        }
                    }

//                    ForEach(viewModel.userData) { user in
//
//                        Text("User")
//
//                        ForEach(user.items) { item in
//
//                            Text(item.title)
//
//                        }
//
//                    }
                    
                    
//                            LazyVGrid(columns: adaptiveColumns, spacing: 20) {
//
//                                ForEach(0...1, id: \.self) {
//                                    user in
//                                    NavigationLink(destination: DetailView( title: user.title, price: user.price, description: user.description, image: user.image))
//                                    {ItemView(title: user.title, price: user.price, image: user.image)
//                                    }
//
//
//                                    //                                                    ForEach(searchResults, id: \.self) { name in
//                                    //                                        NavigationLink(destination: Text(name)) {
//                                    //                                            Text(name)
//                                    //                                        }
//
//
//                                }
//                            }
                        
                       

                    
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
