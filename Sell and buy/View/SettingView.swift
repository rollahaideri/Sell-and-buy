//
//  SettingView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-29.
//

import SwiftUI

struct SettingView: View {
    
    @ObservedObject var viewModel: FirebaseViewModel
    
    var body: some View {
        
        
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("Background-Start"),Color("Background-End")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            
            Button {
                
                    viewModel.logOut()
                
            } label: {
                Text("Sign out").foregroundColor(.white)
            }

            
            
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(viewModel: FirebaseViewModel())
    }
}
