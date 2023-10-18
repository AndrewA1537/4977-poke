//
//  RegisterView.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-10-02.
//



import SwiftUI



struct RegisterView: View
{
    @StateObject var viewModel = RegisterViewViewModel(name: "", email: "", password: "")
    
    var body: some View
    {
        // Header
        HeaderView(title: "Register", subtitle: "Start getting organized", angle: -15, backColor: .orange)
        // Register form
        Form
        {
            if(!viewModel.errMsg.isEmpty)
            {
                Text(viewModel.errMsg)
                    .foregroundColor(.red)
            }
            
            TextField("Full Name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocorrectionDisabled()
            
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
            
            Button("Create Account")
            {
                viewModel.register()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(50)
        }
        
        Spacer()
    }
}



#Preview 
{
    RegisterView()
}
