//
//  ListView.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-10-04.
//



import SwiftUI



struct ListView: View 
{
    // Initialize the PokemonViewModel as a StateObject
    @StateObject private var viewModel = PokemonViewModel()
    
    // Define a constant for the number and configuration of columns in the grid
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
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
        }
        .padding()
        .onAppear
        {
            // Fetch the first-generation Pokemon when the view appears
            viewModel.fetchFirstGenPokemon()
        }
    }
}



#Preview 
{
    ListView()
}
