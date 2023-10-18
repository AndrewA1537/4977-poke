//
//  User.swift
//  pokeAPI
//
//  Created by Petronela Anca on 2023-10-17.
//



import Foundation



struct User: Codable
{
    let id:     String
    let name:   String
    let email:  String
    let joined: TimeInterval
}
