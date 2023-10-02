//
//  ContentView.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-09-29.
//



import SwiftUI



// Define a struct named ContentView conforming to View protocol, meaning it will represent a view.
struct ContentView: View
{
    // The body property defines the structure and content of the view.
    var body: some View
    {
        // A VStack is a view that arranges its children in a vertical line.
        VStack
        {
            // TabView is a view for presenting multiple views representing selectable tab items.
            TabView(selection: .constant(1)) // Sets the initial selected tab item to the one tagged with 1.
            {
                // LoginView() represents the login tab item.
                LoginView().tabItem
                {
                    Image(systemName: "person") // Sets the tab image to the system image named "person".
                    Text("Login") // Sets the tab title to "Login".
                }.tag(1) // Assigns a tag of 1 to this tab item.
                
                // The Image("poke-soccer") represents a tab item with an image.
                Image("poke-soccer")
                    .resizable() // Makes the image resizable.
                    .scaledToFit() // Scales the image to fit within its containing view.
                    .tabItem
                {
                    Image(systemName: "house") // Sets the tab image to the system image named "house".
                    Text("Home") // Sets the tab title to "Home".
                }
                .tag(0) // Assigns a tag of 0 to this tab item.
                
                // RegisterView() represents the register tab item.
                RegisterView().tabItem
                {
                    Image(systemName: "person.badge.plus") // Sets the tab image to the system image named "person.badge.plus".
                    Text("Register") // Sets the tab title to "Register".
                }.tag(2) // Assigns a tag of 2 to this tab item.
            }
        }
        .padding() // Adds padding around the VStack.
    }
}



#Preview
{
    ContentView()
}
