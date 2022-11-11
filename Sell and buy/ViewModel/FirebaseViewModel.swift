//
//  FirebaseViewModel.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-29.
//

import Foundation
import Firebase
import FirebaseStorage


class FirebaseViewModel: ObservableObject {
    
    let db = Firestore.firestore()
    @Published var items = [Items]()
    @Published var userLoggedIn = false
    @Published var currentUser: User?
    @Published var userData = [UserData]()
    
    var userDocumentListener: ListenerRegistration?
    
    init() {
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                self.userLoggedIn = true
                self.currentUser = user
                self.getAllDocument()
            } else {
                self.userLoggedIn = false
                self.currentUser = nil
                self.stopListeningToDb()
            }
        }
    }
    
    
    // Creating user with email and password through firebase Auth
    func registerUser(email: String, password: String) {
        let dbRef = db.collection("users")
        Auth.auth().createUser(withEmail: email, password: password) {( authResult, error ) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let authResult = authResult {
                
                // Creating a empty array for every new user 
                let newItem = UserData(id: authResult.user.uid,items: [])
                
                do {
                    _ = try dbRef.document(authResult.user.uid).setData(from: newItem)
                } catch {
                    print("Error creating the document")
                }
                
            }
        }
    }
    
    
    // Sign in function
    func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            if let error = error {
                print(error.localizedDescription)
                
            } else {
                print("Logined Successfuly")
                
            }
        }
    }
    
    // Sing out function
    func logOut(){
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out")
        }
    }
    
    // Listening to Database & getting the documents from every user
    func getAllDocument() {
        
        userDocumentListener =  self.db.collection("users").addSnapshotListener ({ (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            }
            
            guard let querySnapshot = querySnapshot else {
                return
            }
            self.userData = []
            for document in querySnapshot.documents {
                
                let result = Result {
                    
                    try document.data(as: UserData.self)
                    
                }
                
                switch result {
                case.success(let userDocument):
                    
                    self.userData.append(userDocument)
                    
                    break
                case.failure(let error):
                    print("Error getting Data: \(error.localizedDescription)")
                    break
                }
            }
        })
    }

    // Stop listening to database
    func stopListeningToDb() {
        if let userDocumentListener = userDocumentListener {
            userDocumentListener.remove()
        }
    }
    
    // Add data via FireBase Firestore
    func addData(items: Items) {
        if let currentUser = currentUser {
            do {
                try db.collection("users").document(currentUser.uid).updateData(["items": FieldValue.arrayUnion([Firestore.Encoder().encode(items)])])
            } catch {
                print("Error occured retriving data")
            }
        }
    }
}


