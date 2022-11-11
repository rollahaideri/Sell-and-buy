//
//  ContentView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-28.
//

import SwiftUI

struct ContentView: View {
    
    @State var showModal = false
    @State var selectedItem = 1
    @State var oldSelectedItem = 1
    @StateObject var viewModel = FirebaseViewModel()
    
    var body: some View {
        
        NavigationView {
            
            if viewModel.userLoggedIn {
                TabView (selection: $selectedItem){
                    HomeView(viewModel: viewModel)
                        .tabItem {
                            Image(systemName:"house.fill")
                                .renderingMode(.template)
                        }
                        .tag(1)
                    
                    Text("")
                        .tabItem {
                            Image(systemName:"plus.app.fill")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 30, height: 30)
                        }.tag(2)
                    
                    SettingView(viewModel: viewModel)
                        .tabItem {
                            Image(systemName:"gearshape.fill")
                                .renderingMode(.template)
                        }.tag(3)
                }
                .onChange(of: selectedItem) { newValue in
                    if newValue == 2 {
                        showModal = true
                    } else {
                       oldSelectedItem = selectedItem
                    }
                }
                .sheet(isPresented: $showModal) {
                    selectedItem = oldSelectedItem
                } content: {
                    AddView(viewModel: viewModel, showModal: $showModal)
                }

            } else {
                SignInView(viewModel: viewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
