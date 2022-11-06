//
//  AddView.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-29.
//

import SwiftUI
import FirebaseStorage
import FirebaseFirestore

struct AddView: View {
    
    @ObservedObject var viewModel : FirebaseViewModel
    @State private var title = ""
    @State private var price = ""
    @State private var description = ""
    @State var imageUrl = ""
    @State var isPickerShowing = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State var selectedImage: UIImage?
    @State var showSheet : Bool = false
    @Binding var showModal : Bool
    
    
    var body: some View {
        ZStack (){
            LinearGradient(gradient: Gradient(colors: [Color("Background-Start"),Color("Background-End")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            
            // Main Container
            ScrollView {
                
                
                VStack {
                    Text("Publish new item").font(.pageSubTitle)
                    
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
                            .keyboardType(.numberPad)
                            .overlay(  Text("Kr").foregroundColor(Color("Field-Text")).padding(.trailing), alignment: .trailing)
                    
                    
                    
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
                
                // Photo Libarary button
                HStack{
                    Button {
                        showSheet = true
                    } label: {
                        VStack (alignment: .leading){
                            Text("Photo")
                                .foregroundColor(Color("Field-Text"))
                            if selectedImage != nil {
                                Image(uiImage: selectedImage!)
                                    .resizable()
                                    .frame(width: 100, height: 70)
                                    .cornerRadius(14)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(Color.accentColor ,lineWidth: 1)
                                    )
                            } else {
                                Image(systemName: "plus")
                                
                                    .frame(width: 100, height: 70)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(Color.accentColor ,lineWidth: 1)
                                    )
                                .background(Color("Field-Color")) }
                        }
                    }.confirmationDialog("Source", isPresented: $showSheet) {
                        Button("Photo Library") {
                            isPickerShowing = true
                            sourceType = .photoLibrary
                        }
                        Button("Camera") {
                            isPickerShowing = true
                            sourceType = .camera
                        }
                        
                        
                    }
                    Spacer()
                }.padding()
                
                // Buttons Containar
                VStack (spacing: 25){
                    Button {
                        
                        if title != "" && price != "" && description != ""  {
                            viewModel.addData(items: Items(title: title, price: price, description: description,image: imageUrl))
                            showModal = false
                        }
                        
                        
                    } label: {
                        Text("Publish").font(.buttonTitle)
                    }.buttonStyle(CustomButton())
                    Button {
                        showModal = false
                    } label: {
                        Text("Cancel").font(.pageSubTitle)
                        
                    }
                    
                }.padding()
                
            }
            
        }
        .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing, imageUrl: $imageUrl, sourceType: sourceType)
        }
        
    }
  
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(viewModel: FirebaseViewModel(),showModal: .constant(false))
    }
}
