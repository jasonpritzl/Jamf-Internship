//
//  AnimalTableViewCell.swift
//  Acme App
//
//  Created by Jason Pritzl on 2/8/22.
//
//  This class makes the calls to set up the table view

import UIKit

class AnimalTableViewCell: UITableViewCell {

    @IBOutlet weak var animalType: UILabel!
    
    //Calls updateUI to update the text that should be displayed in the cell
    func setCellWithValuesOf(_ animal:String) {
        updateUI(animal: animal.self)
    }
    
    //Updates what animal should be displayed in the cell
    private func updateUI(animal: String) {
        self.animalType.text = animal
    }

}
