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
    // Initialize the PokemonViewModel as a StateObject
    @StateObject private var viewModel = PokemonViewModel()
    
    // Define a constant for the number and configuration of columns in the grid
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    // Define the body property to describe the view’s content and layout
    var body: some View 
    {
        // Use a vertical stack to lay out the view's components vertically
        VStack 
        {
            // Display the "Pokedex" title
            Text("Pokedex")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
                .padding(.bottom, 20)
            
            // Encapsulate the grid inside a scroll view, allowing the user to scroll through items
            ScrollView 
            {
                // Define a LazyVGrid with the specified columns
                LazyVGrid(columns: columns, spacing: 0)
                {
                    // Loop through the list of Pokemon and create a card view for each
                    ForEach(viewModel.pokemonList) 
                    { 
                        pokemon in CardView(pokemon: pokemon)
                    }
                }
            }
            
            // Define a TabView to provide a tabbed interface
            TabView(selection: .constant(1))
            {
                Text("Tab Content 1").tabItem { Text("Home") }.tag(1)
                Text("Tab Content 2").tabItem { Text("Search") }.tag(2)
                Text("Tab Content 3").tabItem { Text("Favourite") }.tag(3)
                Text("Tab Content 4").tabItem { Text("Profile") }.tag(4)
            }
        }
        .padding()
        .onAppear 
        {
            // Fetch the first-generation Pokemon when the view appears
            viewModel.fetchFirstGenPokemon()
        }
    }
}



// Define the CardView struct to represent the UI for an individual Pokemon card
struct CardView: View 
{
    // Define a variable to hold a Pokemon instance
    var pokemon: Pokemon
    
    // Define the body property to describe the view’s content and layout
    var body: some View 
    {
        // Use a vertical stack to lay out the components vertically
        VStack 
        {
            // Check if the URL string is valid and initialize an AsyncImage with the URL, or use a placeholder image if it's invalid
            if let url = URL(string: pokemon.sprites.front_default ?? "") 
            {
                AsyncImage(url: url) 
                {
                    image in image
                        .resizable()
                        .scaledToFit()
                } placeholder: 
                {
                    ProgressView()
                }
            } 
            else
            {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
            }
            
            // Display the capitalized Pokemon name below the image
            Text(pokemon.name.capitalized)
                .foregroundColor(.white)
        }
        // Style the background, shadow, and padding of each card
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
        .shadow(radius: 90)
        .padding()
    }
}



#Preview
{
    MainLandingView()
}
