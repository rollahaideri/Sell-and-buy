//
//  FirebaseViewModel.swift
//  Sell and buy
//
//  Created by Rohullah Haideri on 2022-10-29.
//

import Foundation
import Firebase



class FirebaseViewModel: ObservableObject {
    
    let db = Firestore.firestore()
    @Published var items = [Items]()
    @Published var userLoggedIn = false
    @Published var currentUser: User?
    @Published var userDocument: Items?
    var userDocumentListener: ListenerRegistration?
    
    init() {
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                self.userLoggedIn = true
                self.currentUser = user
                self.listenToDb()
                
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
                let newItem = Items(id: authResult.user.uid, title: "", price: "", description: "")
                
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
    
    // Database Listener
    func listenToDb() {
        if let currentUser = currentUser {
            
            userDocumentListener = self.db.collection("user").document(currentUser.uid).addSnapshotListener({ snapshot , error in
                if let error = error {
                    print("Error occured \(error)")
                    return
                }
                guard let snapshot = snapshot else {
                    return
                    
                }
                
                let result = Result {
                    try snapshot.data(as: Items.self)
                }
                
                switch result {
                case .success(let userData):
                   
                        self.userDocument = userData
                    
                    print(userData)
                    break
                case .failure(let error):
                    print("Something went wrong retrieving data: \(error)")
                    break
                }
            })
            
        }
    }
    
    // Stop listening to database
    func stopListeningToDb() {
        if let userDocumentListener = userDocumentListener {
            userDocumentListener.remove()
        }
    }
}


