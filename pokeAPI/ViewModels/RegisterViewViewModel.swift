//
//  RegisterViewViewModel.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-10-17.
//



import Foundation
import FirebaseAuth
import FirebaseFirestore



class RegisterViewViewModel: ObservableObject
{
    @Published var name:     String = ""
    @Published var email:    String = ""
    @Published var password: String = ""
    @Published var errMsg:   String = ""
    
    init(name: String, email: String, password: String)
    {
        self.name     = name
        self.email    = email
        self.password = password
    }
    
    
    func register()
    {
        // do something and if its FALSE do the ELSE part
        guard validate()
        else
        {
            return
        }
        // the data entered by the user is clean then talk to firebase
        // register user with Firebase Auth
        Auth.auth().createUser(withEmail: email, password: password) { [weak self]
            result, error in
            guard let userId = result?.user.uid
            else
            {
                return
            }
            self?.insertUser(id: userId)
        }
    }
    
    
    // we are not creating an auth user here
    // we are adding custom data to Firestore
    func insertUser(id: String)
    {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    
    private func validate() -> Bool
    {
        errMsg = ""
        
        // do something and if its FALSE do the ELSE part
        
        // Check that input not empty
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else
        {
            errMsg = "Please fill in name, email and password fields."
            return false
        }
        
        // email@foo.com
        guard email.contains("@") && email.contains(".")
        else
        {
            errMsg = "Please enter a valid email address."
            return false
        }
        
        guard password.count >= 6
        else
        {
            errMsg = "Password must be at least 6 characters long."
            return false
        }
        return true
    }
}
