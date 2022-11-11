//
//  SignInView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-28.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: FirebaseViewModel
    
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    
    var body: some View {
        ZStack {
            LinearGradient.customGradient
                .ignoresSafeArea()
            
            VStack (spacing: 40){
                // Title Container
                VStack(alignment: .leading) {
                    Text("Sign in").font(.pageTitle)
                    Text("Welcome!").font(.pageSubTitle)
                }
                
                // Email Field Container
                VStack(alignment: .leading, spacing: 9){
                    Text("Email").font(.pageSubTitle).foregroundColor(Color("Field-Text"))
                    TextField("", text: $email)
                        .foregroundColor(Color("Field-Text"))
                        .textFieldStyle(CustomTextField())
                    
                }.padding()
                
                
                // Password Field Container
                VStack(alignment: .leading, spacing: 9){
                    Text("Password").font(.pageSubTitle).foregroundColor(Color("Field-Text"))
                    SecureField("", text: $password)
                        .foregroundColor(Color("Field-Text"))
                        .textFieldStyle(CustomTextField())
                    
                }.padding()
                
                // Buttons Container
                VStack (spacing: 15){
                    // Sign in Button
                    Button {
                        isLoading = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            if email != "" && password != "" {
                                viewModel.loginUser(email: email, password: password)
                            }
                            isLoading = false
                        }
                        
                    } label: {
                        if isLoading {
                            DotAnimationView()
                        } else {Text("Sign in").font(.buttonTitle)}
                    }.buttonStyle(CustomButton())
                    
                    Text("------------------- or -------------------").foregroundColor(Color("Field-Text"))
                    NavigationLink {
                        withAnimation {
                            SignUpView(viewModel: viewModel)
                        }
                    } label: {
                        Text("Sign up").font(.pageSubTitle).foregroundColor(Color("Field-Text"))
                    }
                    
                }.padding()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: FirebaseViewModel())
    }
}
