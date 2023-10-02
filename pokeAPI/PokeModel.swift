//
//  PokeModel.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-10-02.
//



import SwiftUI



struct Pokemon: Identifiable, Decodable
{
    struct Sprite: Decodable
    {
        let front_default: String?
    }
    
    struct Stat: Decodable
    {
        let base_stat: Int
        let effort: Int
        let stat: StatInfo
    }
    
    struct StatInfo: Decodable
    {
        let name: String
    }
    
    var id: Int
    var name: String
    var sprites: Sprite
    var stats: [Stat]
}


// Define a view model class to manage the data
class PokemonViewModel: ObservableObject
{
    @Published var pokemonList: [Pokemon] = []
    
    func fetchFirstGenPokemon()
    {
        let group = DispatchGroup()
        
        for id in 1...151
        {
            group.enter()
            let urlString = "https://pokeapi.co/api/v2/pokemon/\(id)"
            
            guard let url = URL(string: urlString) else
            {
                print("Invalid URL")
                group.leave()
                continue
            }
            
            let task = URLSession.shared.dataTask(with: url) 
            { data, response, error in
                if let data = data
                {
                    do
                    {
                        let decoder = JSONDecoder()
                        let pokemon = try decoder.decode(Pokemon.self, from: data)
                        DispatchQueue.main.async
                        {
                            self.pokemonList.append(pokemon)
                        }
                    }
                    catch
                    {
                        print("Failed to decode JSON: \(error)")
                    }
                }
                group.leave()
            }
            task.resume()
        }
        
        group.notify(queue: .main) {
            self.pokemonList.sort { $0.id < $1.id }
        }
    }
}
