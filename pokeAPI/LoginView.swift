//
//  LoginView.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-10-02.
//



import SwiftUI



// Define a struct representing a login view.
struct LoginView: View
{
    // Declare state variables to hold the email and password entered by the user,
    // and a boolean to control navigation to the main view.
    @State private var email: String        = ""
    @State private var password: String     = ""
    @State private var navigateToMain: Bool = false
    
    // Define the body of the LoginView
    var body: some View
    {
        // Embed all content inside a NavigationView, to allow navigation between views.
        NavigationView
        {
            // Use NavigationStack to hold the view components and manage the navigation stack.
            NavigationStack
            {
                // Use VStack to align child views vertically.
                VStack
                {
                    // Create a Text view for the login title.
                    Text("LOGIN")
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
                    
                    // Create a Button for the login action.
                    Button("Login") 
                    {
                        // When the button is tapped, perform the login action.
                        // If login is successful, navigate to the Main Landing View.
                        self.navigateToMain = true
                    }
                    .padding() // Add padding around the Button.
                    .background(Color.blue) // Set the background color of the Button to blue.
                    .foregroundColor(.white) // Set the text color of the Button to white.
                    .cornerRadius(8) // Round the corners of the Button.
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1)) // Add a rounded rectangle border around the Button.
                    .navigationDestination(isPresented: $navigateToMain, destination: {
                        MainLandingView() // Set the destination of the navigation to the MainLandingView.
                    })
                }
                .padding(.horizontal) // Add horizontal padding to the VStack.
            }
        }
    }
}



#Preview
{
    LoginView()
}
