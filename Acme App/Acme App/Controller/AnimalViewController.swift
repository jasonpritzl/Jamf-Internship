//
//  ViewController.swift
//  Acme App
//
//  Created by Jason Pritzl on 2/7/22.
//
//  This class is the main view controller for the app

import UIKit

class AnimalViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = AnimalViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAnimalsData()
    }
    
    //Calls the fetchAnimals method to load the animals data from the website
    private func loadAnimalsData() {
        viewModel.fetchAnimals { [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.reloadData()
        }
    }
}

extension AnimalViewController: UITableViewDataSource {
    
    //Sets the number of cells produced based on how many animals are listed on the website
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    //Gets the information from the website to display the animals in each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AnimalTableViewCell
        let animal = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(animal)
        return cell
    }
}
