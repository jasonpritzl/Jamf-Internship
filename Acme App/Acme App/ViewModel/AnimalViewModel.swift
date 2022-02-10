//
//  AnimalViewModel.swift
//  Acme App
//
//  Created by Jason Pritzl on 2/7/22.
//
//  This class is the view model for the table view

import Foundation

class AnimalViewModel {
    var apiService = ApiService()
    var animal = AnimalSelect(animals: [String]())
    
    //Calls getData to get the information from the website
    //Puts the data from the website into a variable for use
    func fetchAnimals(completion: @escaping () -> ()) {
        apiService.getData { [weak self] (result) in
            switch result {
            case .success(let listOf):
                self?.animal.animals = listOf.animals
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    
    //Sets the number of rows in a section to how many animals are given
    func numberOfRowsInSection(section: Int) -> Int {
        if animal.animals!.count != 0 {
            return animal.animals!.count
        }
        return 0
    }
    
    //Sets up what should be displayed for each cell
    func cellForRowAt(indexPath: IndexPath) -> String {
        return animal.animals![indexPath.row]
    }
}
