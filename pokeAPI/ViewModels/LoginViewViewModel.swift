//
//  LoginViewViewModel.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-10-17.
//



import Foundation
import FirebaseAuth



class LoginViewViewModel: ObservableObject
{
    @Published var email:    String = ""
    @Published var password: String = ""
    @Published var errMsg:   String = ""
    
    init(email: String, password: String)
    {
        self.email    = email
        self.password = password
    }
    
    func login()
    {
        guard validate()
        else
        {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool
    {
        errMsg = ""
        
        // do something and if its FALSE do the ELSE part
        
        // Check that input not empty
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else
        {
            errMsg = "Please fill in email and password fields."
            return false
        }
        // email@foo.com
        guard email.contains("@") && email.contains(".")
        else
        {
            errMsg = "Please enter a valid email address."
            return false
        }
        return true
    }
}
