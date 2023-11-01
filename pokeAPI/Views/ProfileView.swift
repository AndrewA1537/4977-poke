//
//  ProfileView.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-10-04.
//



import SwiftUI



struct ProfileView: View
{
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                
                HeaderView(title: "Profile", subtitle: "", angle: -15, backColor: .cyan)

                
                // add an avatar
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.blue)
                    .frame(width: 125, height: 125)
                
                // show name, email, and member since date
                VStack(alignment: .leading)
                {
                    if let user = viewModel.user
                    {
                        profile(user: user)
                    }
                    else
                    {
                        Text("Loading Profile...")
                    }
                }
                .padding()
                
                // sign out
                Button("Logout")
                {
                    viewModel.logout()
                }
                .tint(.red)
                .padding()
                
                
                Spacer()
            }
            // .navigationTitle("Profile")
        }
        .onAppear()
        {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View
    {
        HStack
        {
            Text("Name: ").bold()
            Text(user.name)
        }
        .padding()
        
        HStack
        {
            Text("Email: ").bold()
            Text(user.email)
        }
        .padding()
        
        HStack
        {
            Text("Member Since: ").bold()
            
            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated,time:.shortened))")
        }
        .padding()
    }
}



#Preview
{
    ProfileView()
}
