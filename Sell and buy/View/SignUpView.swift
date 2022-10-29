//
//  SignUpView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-28.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @FocusState private var istyping :Bool
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("Background-Start"),Color("Background-End")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Spacer(minLength: 180)
                
                
                // Title Container
                VStack(alignment: .leading) {
                    if !istyping {
                        Text("Sign Up").font(.pageTitle).foregroundColor(.white).focused($istyping)
                        Text("Create a new account!").font(.pageSubTitle).foregroundColor(.white).focused($istyping)
                    }
                }
                .padding(.trailing, 110)
                
                
                Spacer(minLength: 60)
                
                // Email Field Container
                VStack(alignment: .leading, spacing: 9){
                    Text("Email").font(.pageSubTitle).foregroundColor(Color("Field-Text"))
                    TextField("", text: $email)
                        .focused($istyping)
                        .foregroundColor(Color("Field-Text"))
                        .textFieldStyle(CustomTextField())
                    
                }.padding(.horizontal, 30)
                
                Spacer(minLength: 36)
                
                // Password Field Container
                VStack(alignment: .leading, spacing: 9){
                    Text("Password").font(.pageSubTitle).foregroundColor(Color("Field-Text"))
                    SecureField("", text: $password)
                        .focused($istyping)
                        .foregroundColor(Color("Field-Text"))
                        .textFieldStyle(CustomTextField())
                    
                }.padding(.horizontal, 30)
                
                Spacer(minLength: 36)
                
                // Confirm Passwor Field Container
                VStack(alignment: .leading, spacing: 9){
                    Text("Confirm Password").font(.pageSubTitle).foregroundColor(Color("Field-Text"))
                    
                    SecureField("", text: $confirmPassword)
                        .focused($istyping)
                        .foregroundColor(Color("Field-Text"))
                        .textFieldStyle(CustomTextField())
                    
                }.padding(.horizontal, 30)
                
                Spacer(minLength: 80)
                
                // Buttons Container
                VStack (spacing: 15){
                    Button {
                        print("button pressed")
                    } label: {
                        Text("Sign up").font(.buttonTitle)
                    }.buttonStyle(CustomButton())
                    
                    Text("------------------- or -------------------").foregroundColor(Color("Field-Text"))
                    NavigationLink {
                        withAnimation {
                            SignInView()
                        }
                    } label: {
                        Text("Sign in").font(.pageSubTitle).foregroundColor(Color("Field-Text"))
                    }
                    
                }.padding(.bottom, 190)
                
                
            }
        }
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
