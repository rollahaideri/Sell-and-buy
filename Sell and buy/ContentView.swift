//
//  ContentView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-28.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = FirebaseViewModel()
    
    var body: some View {
        
        NavigationView {
            
            if viewModel.userLoggedIn {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName:"house.fill")
                                .renderingMode(.template)
                        }
                    
                    AddView()
                        .tabItem {
                            Image(systemName:"plus.app.fill")
                                .renderingMode(.template)
                            
                        }
                    
                    SettingView(viewModel: viewModel)
                        .tabItem {
                            Image(systemName:"gearshape.fill")
                                .renderingMode(.template)
                        }
                }
                
            } else {
                
                
                SignInView(viewModel: viewModel)
                SignUpView(viewModel: viewModel)
                
                
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
