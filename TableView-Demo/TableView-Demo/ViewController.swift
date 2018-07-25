//
//  ViewController.swift
//  TableView-Demo
//
//  Created by Soeng Saravit on 6/11/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var fruits:[String] = ["Apple","Apricot", "Banana", "Blueberry", "Cantaloupe"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fruitcell")
        cell?.textLabel?.text = fruits[indexPath.row]
        cell?.imageView?.image = UIImage(named: fruits[indexPath.row])
        
        return cell!
    }
   


}

