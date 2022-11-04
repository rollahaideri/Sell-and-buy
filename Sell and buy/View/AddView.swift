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
    
    
    //    init() {
    //        UITextView.appearance().backgroundColor = .clear // First, remove the UITextView's backgroundColor.
    //    }
    @ObservedObject var viewModel : FirebaseViewModel
    @State private var title = ""
    @State private var price = ""
    @State private var description = ""
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    @State var imageUrl = ""
    
    
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
                
                // Photo Libarary button
                HStack{
                    Button {
                        isPickerShowing = true
                    } label: {
                        Text("Select Photo")
                            .foregroundColor(.white)
                    }
                    Button {
                        if selectedImage != nil {
                            
                                uploadPhoto()
                            
                            
                        }
                    } label: {
                        Text("Upload Photo")
                            .foregroundColor(.white)
                    }
                    
                    
                    if selectedImage != nil {
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    
                }
                
                // Buttons Containar
                VStack (spacing: 25){
                    Button {
//                        if selectedImage != nil {
//                            uploadPhoto()
//                        }
                        if title != "" && price != "" && description != ""  {
                            viewModel.addData(items: Items(title: title, price: price, description: description,image: imageUrl))
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
        .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
        }
    }
    func uploadPhoto() {
        
        // Make sure that the selected image poperty isn't nil
        guard selectedImage != nil else{
            return
        }
        let storageRef = Storage.storage().reference()
        
        //Turn our image into data
        let imageData = selectedImage!.jpegData(compressionQuality: 0.2)
        
        
        guard imageData != nil else {
            return
        }
        
        // Specify the file path an name
        let path = "images/\(UUID().uuidString).jpg"
        let fileRef = storageRef.child(path)
        
        // Upload that data
        let uploadTask = fileRef.putData(imageData!) { metadata, error in
            if error == nil && metadata != nil {
                
                    fileRef.downloadURL (completion:{ url, error in
                        guard let url = url, error == nil else {
                            return
                        }
                        self.imageUrl = url.absoluteString
                        print("Download url: \(imageUrl)")
                        
//                        self.imageUrl = urlString
                        
                        
                    
                        
                    })
                
                
            }
        }
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(viewModel: FirebaseViewModel())
    }
}
