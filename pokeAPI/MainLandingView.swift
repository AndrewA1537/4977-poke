//
//  MainLandingView.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-10-02.
//



import SwiftUI



struct MainLandingView: View {
    @StateObject private var viewModel = PokemonViewModel()
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        VStack {
            Text("Pokedex")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
                .padding(.bottom, 20)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.pokemonList) { pokemon in
                        CardView(pokemon: pokemon)
                    }
                }
            }
            
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) 
            {
                Text("Tab Content 1").tabItem { Text("Home") }.tag(1)
                Text("Tab Content 2").tabItem { Text("Search") }.tag(2)
                Text("Tab Content 3").tabItem { Text("Favourite") }.tag(3)
                Text("Tab Content 4").tabItem { Text("Profile") }.tag(4)
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchFirstGenPokemon()
        }
    }
}


struct CardView: View {
    var pokemon: Pokemon
    
    var body: some View {
        VStack {
            if let url = URL(string: pokemon.sprites.front_default ?? "") {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
            }
            
            Text(pokemon.name.capitalized)
                .foregroundColor(.white)
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
        .shadow(radius: 10)
        .padding()
    }
}




#Preview
{
    MainLandingView()
}
