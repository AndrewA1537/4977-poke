//
//  PokeModel.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-10-02.
//



import SwiftUI



// Define a structure to represent a Pokemon that conforms to Identifiable and Decodable protocols
struct Pokemon: Identifiable, Decodable
{
    // Nested struct to represent a Sprite, conforms to Decodable
    struct Sprite: Decodable
    {
        // Optional string to represent the default front sprite
        let front_default: String?
    }
    
    // Nested struct to represent a Stat, conforms to Decodable
    struct Stat: Decodable
    {
        // Integers representing base stat and effort of a Pokemon
        let base_stat: Int
        let effort:    Int
        // Instance of StatInfo representing the name of the stat
        let stat: StatInfo
    }
    
    // Nested struct to represent information of a stat, conforms to Decodable
    struct StatInfo: Decodable
    {
        // String representing the name of the stat
        let name: String
    }
    
    // Various properties of a Pokemon, including id, name, sprites, and stats
    var id:      Int
    var name:    String
    var sprites: Sprite
    var stats:   [Stat]
}

// Define a view model class to manage the data
class PokemonViewModel: ObservableObject
{
    // Published array of Pokemon, observable by the View
    @Published var pokemonList: [Pokemon] = []
    
    // Function to fetch First Generation Pokemon
    func fetchFirstGenPokemon()
    {
        // Create a DispatchGroup to manage multiple asynchronous tasks
        let group = DispatchGroup()
        
        // Loop through Pokemon ID 1 to 151
        for id in 1...151
        {
            // Enter the dispatch group
            group.enter()
            // Constructing URL string
            let urlString = "https://pokeapi.co/api/v2/pokemon/\(id)"
            
            // Checking the validity of URL
            guard let url = URL(string: urlString) else
            {
                print("Invalid URL")
                // Leave the dispatch group if the URL is invalid
                group.leave()
                continue
            }
            
            // Creating data task to fetch data from the URL
            let task = URLSession.shared.dataTask(with: url)
            { data, response, error in
                // Checking if data is received
                if let data = data
                {
                    do
                    {
                        // Decode received data into Pokemon structure
                        let decoder = JSONDecoder()
                        let pokemon = try decoder.decode(Pokemon.self, from: data)
                        // Append the decoded Pokemon to pokemonList on the main thread
                        DispatchQueue.main.async
                        {
                            self.pokemonList.append(pokemon)
                        }
                    }
                    catch
                    {
                        // Print error if decoding fails
                        print("Failed to decode JSON: \(error)")
                    }
                }
                // Leave the dispatch group once data task is complete
                group.leave()
            }
            // Start the data task
            task.resume()
        }
        
        // Notify once all the tasks in the dispatch group are complete
        group.notify(queue: .main) 
        {
            // Sort the pokemonList based on Pokemon ID
            self.pokemonList.sort { $0.id < $1.id }
        }
    }
}
