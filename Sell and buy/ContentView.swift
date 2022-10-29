//
//  ContentView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-28.
//

import SwiftUI

struct ContentView: View {
    
   
    
    var body: some View {
        
        
        
        
            
//                SignInView()
//                SignUpView()
            
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
                
                SettingView()
                    .tabItem {
                        Image(systemName:"gearshape.fill")
                            .renderingMode(.template)
                    }
            }
            
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
