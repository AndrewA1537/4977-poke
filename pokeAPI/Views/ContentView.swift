//
//  ContentView.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-09-29.
//



import SwiftUI



struct ContentView: View
{
    @StateObject   var viewModel   = ContentViewViewModel()
    @State private var showLoading = true
    
    var body: some View
    {
        VStack
        {
            if(viewModel.isSignedIn && !viewModel.currentUserId.isEmpty)
            {
                HomeView()
            }
            else
            {
                LoginView()
            }
        }
    }
}



#Preview
{
    ContentView()
}
