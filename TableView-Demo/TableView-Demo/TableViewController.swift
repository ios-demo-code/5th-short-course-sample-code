//
//  TableViewController.swift
//  TableView-Demo
//
//  Created by Soeng Saravit on 6/11/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

     var fruits:[String] = ["Apple","Apricot", "Banana", "Blueberry", "Cantaloupe"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fruits.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myfruitcell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = fruits[indexPath.row]
        cell.imageView?.image = UIImage(named:fruits[indexPath.row]
)

        return cell
    }
    


}
