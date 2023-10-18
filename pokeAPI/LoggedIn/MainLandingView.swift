//
//  MainLandingView.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-10-02.
//



import SwiftUI



// Define the main landing view struct
struct MainLandingView: View 
{
    // Define the body property to describe the view’s content and layout
    var body: some View 
    {
        VStack
        {
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/)
            {
                ListView().tabItem { Text("List") }.tag(1)
                SearchView().tabItem { Text("Search") }.tag(2)
                FavouritesView().tabItem { Text("Favourites") }.tag(3)
                ProfileView().tabItem { Text("Profile") }.tag(4)
            }
        }
        .padding()
    }
}



#Preview
{
    MainLandingView()
}
