//
//  LoginView.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-10-02.
//



import SwiftUI



struct LoginView: View
{
    @StateObject var viewModel = LoginViewViewModel(email: "", password: "")
    
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                // Header
                HeaderView(title: "Login", subtitle: "", angle: 15, backColor: .pink)
                
                // Login Form
                Form
                {
                    if(!viewModel.errMsg.isEmpty)
                    {
                        Text(viewModel.errMsg)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    
                    Button("Log In")
                    {
                        viewModel.login()
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }
                
                // Create Account
                VStack
                {
                    Text("New User?")
                    
                    NavigationLink("Create an account")
                    {
                        RegisterView()
                    }
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}




#Preview
{
    LoginView()
}
