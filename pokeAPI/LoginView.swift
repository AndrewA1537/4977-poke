//
//  LoginView.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-10-02.
//



import SwiftUI



struct LoginView: View
{
    
    @State private var email:          String = ""
    @State private var password:       String = ""
    @State private var navigateToMain: Bool   = false
    
    var body: some View
    {
        NavigationView
        {
            NavigationStack
            {
                VStack
                {
                    Text("LOGIN")
                        .font(.largeTitle)    // Makes the text larger
                        .fontWeight(.bold)    // Makes the text bold
                        .padding(.top)        // Adds padding to the top, aligning it at the top of the screen
                        .padding(.bottom, 20) // Adds some space between the title and the fields
                    
                    TextField("Email", text: $email)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                    
                    Button("Login") {
                        // Perform login action
                        // If login is successful, then navigate to the Main Landing View
                        self.navigateToMain = true
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                    .navigationDestination(isPresented: $navigateToMain, destination: {
                        MainLandingView()
                    })
                }
                .padding(.horizontal)
            }
        }
    }
}



#Preview
{
    LoginView()
}
