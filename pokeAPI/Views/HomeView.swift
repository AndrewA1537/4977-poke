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
                ListView()
                    .tabItem
                {
                    Label("List", systemImage: "list.bullet.clipboard")
                }.tag(1)
                
                
                SearchView()
                    .tabItem
                {
                    Label("Search", systemImage: "magnifyingglass")
                }.tag(2)
                
                
                FavouritesView()
                    .tabItem 
                {
                    Label("Favourites", systemImage: "heart")
                }.tag(3)
                
                
                ProfileView()
                    .tabItem
                {
                    Label("Profile", systemImage: "person.circle")
                }.tag(4)
            }
        }
        .padding()
    }
}



#Preview 
{
    HomeView()
}
