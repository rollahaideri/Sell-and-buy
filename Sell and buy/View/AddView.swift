//
//  AddView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-29.
//

import SwiftUI

struct AddView: View {
    
    
//    init() {
//        UITextView.appearance().backgroundColor = .clear // First, remove the UITextView's backgroundColor.
//    }
    @ObservedObject var viewModel : FirebaseViewModel
    @State private var title = ""
    @State private var price = ""
    @State private var description = ""
    
    var body: some View {
        ZStack (){
            LinearGradient(gradient: Gradient(colors: [Color("Background-Start"),Color("Background-End")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            // Main Container
            ScrollView {
                
                VStack {
                    Text("Publish new item").font(.pageSubTitle).foregroundColor(.white)
                }.padding()
                
                // Title Container
                VStack (alignment: .leading, spacing: 7){
                    Text("Title").font(.pageSubTitle).foregroundColor(Color("Field-Text"))
                    TextField("", text: $title).textFieldStyle(CustomTextField())
                        .foregroundColor(Color("Field-Text"))
                    
                }.padding()
                
                // Price Container
                VStack (alignment: .leading, spacing: 7){
                    Text("Price").font(.pageSubTitle).foregroundColor(Color("Field-Text"))
                    TextField("", text: $price).textFieldStyle(CustomTextField())
                        .foregroundColor(Color("Field-Text"))
                    
                }.padding()
                
                // Description Container
                VStack (alignment: .leading, spacing: 7){
                    Text("Description").font(.pageSubTitle).foregroundColor(Color("Field-Text"))
                    TextEditor( text: $description)
                        .foregroundColor(Color("Field-Text"))
                        .font(.pageSubTitle)
                        .frame(minHeight: 100, maxHeight: 150)
                        .scrollContentBackground(.hidden)
                        .background(Color("Field-Color"))
                        .cornerRadius(14)
                }.padding()
                
                // Buttons Containar
                VStack (spacing: 25){
                    Button {
                        if title != "" && price != "" && description != "" {
                            viewModel.addData(items: Items(title: title, price: price, description: description))
                            
                        }
                    } label: {
                        Text("Publish").font(.buttonTitle)
                    }.buttonStyle(CustomButton())
                    Button {
                        print("Cancel Clicked")
                    } label: {
                        Text("Cancel").font(.pageSubTitle)
                            .foregroundColor(Color(.white))
                    }
                    
                }.padding()
                
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(viewModel: FirebaseViewModel())
    }
}
