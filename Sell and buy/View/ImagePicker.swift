//
//  ImagePicker.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-31.
//

import Foundation

import SwiftUI
import Firebase
import FirebaseStorage

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Binding var isPickerShowing: Bool
    @Binding var imageUrl : String
    var sourceType: UIImagePickerController.SourceType = .camera
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ImagePicker
    
    
    init(_ picker: ImagePicker) {
        self.parent = picker
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("image Selected")
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {

                self.parent.selectedImage = image
 
                let storageRef = Storage.storage().reference()
                
                //Turn our image into data
                let imageData = image.jpegData(compressionQuality: 0.2)
                
                guard imageData != nil else {
                    return
                }
                
                // Specify the file path an name
                let path = "images/\(UUID().uuidString).jpg"
                let fileRef = storageRef.child(path)
                
                // Upload that data
                _ = fileRef.putData(imageData!) { metadata, error in
                    if error == nil && metadata != nil {
                        
                        // Get the download url from firebase storage
                            fileRef.downloadURL (completion:{ url, error in
                                guard let url = url, error == nil else {
                                    return
                                }
                                self.parent.imageUrl = url.absoluteString

                            })
                    }
                }
        }
        parent.isPickerShowing = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        parent.isPickerShowing = false
    }
}
