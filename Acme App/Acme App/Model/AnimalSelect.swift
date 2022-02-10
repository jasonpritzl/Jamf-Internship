//
//  AnimalSelect.swift
//  Acme App
//
//  Created by Jason Pritzl on 2/7/22.
//
//  This is the model for all of the structs used for the API data

import Foundation

//Struct for the main website
struct AnimalSelect: Decodable {
    var animals: [String]?
}

//Struct for a specific animal that shows the animal
struct SelectedAnimal: Decodable {
    let animals: String
    let details: AnimalDetails
}

//Struct for a specific animals details
struct AnimalDetails: Decodable {
    let genus: String
    let sound: String
    let habitat: String
    let food: String
}
