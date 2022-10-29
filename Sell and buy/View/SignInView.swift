//
//  SignInView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-28.
//

import SwiftUI

struct SignInView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("Background-Start"),Color("Background-End")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Spacer(minLength: 180)
                
                // Title Container
                VStack(alignment: .leading) {
                    Text("Sign in").font(.pageTitle).foregroundColor(.white)
                    Text("Welcome!").font(.pageSubTitle).foregroundColor(.white)
                }
                .padding(.trailing, 170 )
                
                
                Spacer(minLength: 120)
                
                // Email Field Container
                VStack(alignment: .leading, spacing: 9){
                    Text("Email").font(.pageSubTitle).foregroundColor(Color("Field-Text"))
                    TextField("", text: $email)
                        .foregroundColor(Color("Field-Text"))
                        .textFieldStyle(CustomTextField())
                    
                }.padding(.horizontal, 30)
                
                Spacer(minLength: 36)
                
                // Password Field Container
                VStack(alignment: .leading, spacing: 9){
                    Text("Password").font(.pageSubTitle).foregroundColor(Color("Field-Text"))
                    SecureField("", text: $password)
                        .foregroundColor(Color("Field-Text"))
                        .textFieldStyle(CustomTextField())
                    
                }.padding(.horizontal, 30)
                
                Spacer(minLength: 110)
                
                // Buttons Container
                VStack (spacing: 15){
                    Button {
                        print("button pressed")
                    } label: {
                        Text("Sign in").font(.buttonTitle)
                    }.buttonStyle(CustomButton())
                    
                    Text("------------------- or -------------------").foregroundColor(Color("Field-Text"))
                    NavigationLink {
                        withAnimation {
                            SignUpView()
                        }
                    } label: {
                        Text("Sign up").font(.pageSubTitle).foregroundColor(Color("Field-Text"))
                    }
                    
                }.padding(.bottom, 190)
                
                
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
