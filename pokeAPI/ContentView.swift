//
//  ContentView.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-09-29.
//



import SwiftUI



struct ContentView: View
{
    var body: some View
    {
        VStack
        {
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/)
            {
                LoginView().tabItem
                {
                    Image(systemName: "person")
                    Text("Login")
                }.tag(1)
                
                Image("poke-soccer")
                    .resizable()
                    .scaledToFit()
                    .tabItem
                {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
                
                RegisterView().tabItem
                {
                    Image(systemName: "person.badge.plus")
                    Text("Register")
                }.tag(2)
            }
        }
        .padding()
    }
}



#Preview
{
    ContentView()
}
