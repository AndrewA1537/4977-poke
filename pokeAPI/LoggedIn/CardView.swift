//
//  CardView.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-10-04.
//

import SwiftUI

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
    CardView(pokemon: Pokemon(id: 1, 
                              name: "bulbasaur",
                              sprites: Pokemon.Sprite(front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"),
                              stats: [Pokemon.Stat(base_stat: 50, effort: 1, stat: Pokemon.StatInfo(name: "Speed"))]))
}
