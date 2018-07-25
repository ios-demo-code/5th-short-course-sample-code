//
//  FoodMenuTableViewController.swift
//  Food Menu
//
//  Created by Soeng Saravit on 6/13/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class FoodMenuTableViewController: UITableViewController, UISearchResultsUpdating {
    
    

    var foods:[String] = [
        "Angry Birds Cake",
        "Creme Brelee",
        "Egg Benedict",
        "Full Breakfast",
        "Green Tea",
        "Ham and Cheese Panini",
        "Ham and Egg Sandwich",
        "Hamburger",
        "Instant Noodle with Egg",
        "Japanese Noodle with Pork",
        "Mushroom Risotto",
        "Noodle with BBQ Pork",
        "Starbucks Coffee",
        "Thai Shrimp Cake",
        "Vegetable Curry",
        "White Chocolate Donut"
    ]
    
    var searchController: UISearchController?
    var filterFood: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterFood = foods
        
        searchController = UISearchController(searchResultsController: nil)
        searchController?.dimsBackgroundDuringPresentation = false
        searchController?.hidesNavigationBarDuringPresentation = true
        searchController?.searchResultsUpdater = self
        
        tableView.tableHeaderView = searchController?.searchBar

    }
    
    
    func updateSearchResults(for searchController: UISearchController){
        
        if let searchText = searchController.searchBar.text {
            if searchText != "" {
                filterFood = foods.filter({ (food) -> Bool in
                    return food.lowercased().contains(searchText.lowercased())
                })
            }else {
                filterFood = foods
            }
        }else{
            filterFood = foods
        }
        
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filterFood.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = filterFood[indexPath.row]
        cell.imageView?.image = UIImage(named: filterFood[indexPath.row])

        return cell
    }
    
    @IBAction func infoBarButtonItemPressed(_ sender: Any) {
        let indexPath = tableView.indexPathForSelectedRow
        
        let food = foods[(indexPath?.row)!]
        
        let alert = UIAlertController(title: "Info", message: food, preferredStyle: .alert)
        
        let done = UIAlertAction(title: "Done", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(done)
        
        self.present(alert, animated: true, completion: nil)
    }
}
