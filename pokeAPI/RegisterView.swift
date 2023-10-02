//
//  RegisterView.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-10-02.
//



import SwiftUI



// Define a struct representing a register view.
struct RegisterView: View
{
    // Declare state variables to hold the email and password entered by the user.
    @State private var email:    String = ""
    @State private var password: String = ""
    
    // Define the body of the RegisterView.
    var body: some View
    {
        // Use VStack to align child views vertically.
        VStack
        {
            // Create a Text view for the register title.
            Text("REGISTER")
                .font(.largeTitle)    // Set the font size of the text to large.
                .fontWeight(.bold)    // Set the font weight of the text to bold.
                .padding(.top)        // Add padding to the top of the text view.
                .padding(.bottom, 20) // Add padding to the bottom of the text view.
            
            // Create a TextField for the user to enter their email.
            TextField("Email", text: $email)
                .padding() // Add padding around the TextField.
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1)) // Add a rounded rectangle border around the TextField.
            
            // Create a SecureField for the user to enter their password.
            SecureField("Password", text: $password)
                .padding() // Add padding around the SecureField.
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1)) // Add a rounded rectangle border around the SecureField.
            
            // Create a Button for the registration action.
            Button("Register")
            {
                // This is where the registration action or logic will go,
                // such as validating the entered data and creating a new user account.
            }
            .padding() // Add padding around the Button.
            .background(Color.blue) // Set the background color of the Button to blue.
            .foregroundColor(.white) // Set the text color of the Button to white.
            .cornerRadius(8) // Round the corners of the Button.
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1)) // Add a rounded rectangle border around the Button.
        }
        .padding(.horizontal) // Add horizontal padding to the VStack.
    }
}



#Preview 
{
    RegisterView()
}
