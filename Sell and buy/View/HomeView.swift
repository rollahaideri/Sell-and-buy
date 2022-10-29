//
//  HomeView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-29.
//

import SwiftUI

struct HomeView: View {
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    private var data: [Int] = Array(1...20)
    @State private var searchText = ""
    private let adaptiveColumns = [ GridItem(.adaptive(minimum: 170))]
    var body: some View {
        
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("Background-Start"),Color("Background-End")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                ScrollView{
                    LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                        
                        ForEach(data, id: \.self) {
                            number in ZStack {ItemView()
                            }
                            //                        ForEach(searchResults, id: \.self) { name in
                            //                            NavigationLink(destination: Text(name)) {
                            //                                Text(name)
                            //                            }
                        }
                    }
                }
                .padding()
                .searchable(text: $searchText)
                
            }
        }
        
    }
    //    var searchResults: [String] {
    //        if searchText.isEmpty {
    //            return names
    //        } else {
    //            return names.filter { $0.contains(searchText) }
    //        }
    //    }
}


// Item View




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
