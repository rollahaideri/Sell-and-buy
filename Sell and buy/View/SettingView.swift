//
//  SettingView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-29.
//

import SwiftUI

struct SettingView: View {
    
    @ObservedObject var viewModel: FirebaseViewModel
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {

        ZStack{
            LinearGradient.customGradient
                .ignoresSafeArea()
            
            VStack{
                // Theme Text
                VStack (alignment: .leading, spacing: 10){
                    Text("Theme")
                        .font(Font.custom("Poppins-Medium", size: 19))
                    Divider()
                        .overlay(.primary)
                    
                    // Day theme button
                    Button {
                        isDarkMode = false
                        print("Light Mode")
                    } label: {
                        HStack{
                            Image(systemName: "sun.max.fill").resizable().frame(width: 22,height: 22).foregroundColor(isDarkMode ? .gray : .accentColor)
                            Text("Day").foregroundColor(.primary).font(Font.custom("Poppins-Regular", size: 16))
                            Spacer()
                            if isDarkMode { Circle().stroke(Color(.gray), lineWidth: 2).frame(width: 12, height: 12) } else {
                                Circle().stroke(Color.accentColor, lineWidth: 7).frame(width: 12, height: 12)
                            }
                        }
                    }
                    Divider()
                        .overlay(.primary)
                    
                    // Night theme button
                    Button {
                        isDarkMode = true
                    } label: {
                        HStack{
                            Image(systemName: "moon.fill").foregroundColor(isDarkMode ? .accentColor : .gray)
                            Text("Night").foregroundColor(.primary).font(Font.custom("Poppins-Regular", size: 16))
                            Spacer()
                            if isDarkMode { Circle().stroke(Color.accentColor, lineWidth: 7).frame(width: 12, height: 12)}
                            else {
                                Circle().stroke(Color(.gray), lineWidth: 2).frame(width: 12, height: 12)
                            }
                        }
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 25)
                
                Spacer()
        
                VStack{
                    // Sign out button
                    Button {
                        viewModel.logOut()
                    } label: {
                        Text("Sign out")
                            .foregroundColor(.primary)
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(14)
                    }
                }
                Spacer()
                
            }
            
        }.toolbarBackground(.visible, for: .tabBar)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(viewModel: FirebaseViewModel())
    }
}
