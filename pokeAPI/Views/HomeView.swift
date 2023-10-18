//
//  HomeView.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-10-17.
//



import SwiftUI



struct HomeView: View
{
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
    HomeView()
}
