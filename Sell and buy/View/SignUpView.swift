//
//  SignUpView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-28.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: FirebaseViewModel
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @FocusState private var istyping : Bool
    
    var body: some View {
        ZStack{
            LinearGradient.customGradient
                .ignoresSafeArea()
            
            VStack {
                // Title Container
                VStack(alignment: .leading) {
                    if !istyping {
                        Text("Sign Up").font(.pageTitle).focused($istyping)
                        Text("Create a new account!").font(.pageSubTitle).focused($istyping)
                    }
                }
                .padding()

                // Email Field Container
                VStack(alignment: .leading, spacing: 9){
                    Text("Email").font(.pageSubTitle).foregroundColor(Color("Field-Text"))
                    TextField("", text: $email)
                        .focused($istyping)
                        .foregroundColor(Color("Field-Text"))
                        .textFieldStyle(CustomTextField())
                    
                }.padding()
                
                // Password Field Container
                VStack(alignment: .leading, spacing: 9){
                    Text("Password").font(.pageSubTitle).foregroundColor(Color("Field-Text"))
                    SecureField("", text: $password)
                        .focused($istyping)
                        .foregroundColor(Color("Field-Text"))
                        .textFieldStyle(CustomTextField())
                    
                }.padding()
                
                // Confirm Passwor Field Container
                VStack(alignment: .leading, spacing: 9){
                    Text("Confirm Password").font(.pageSubTitle).foregroundColor(Color("Field-Text"))
                    
                    SecureField("", text: $confirmPassword)
                        .focused($istyping)
                        .foregroundColor(Color("Field-Text"))
                        .textFieldStyle(CustomTextField())
                    
                }.padding()

                // Buttons Container
                VStack (spacing: 15){
                    Button {
                        if email != "" && password != "" && confirmPassword == password {
                            viewModel.registerUser(email: email, password: password)
                        }
                    } label: {
                        Text("Sign up").font(.buttonTitle)
                    }.buttonStyle(CustomButton())
                    
                    
                }.padding()
            }
        }
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: FirebaseViewModel())
    }
}
