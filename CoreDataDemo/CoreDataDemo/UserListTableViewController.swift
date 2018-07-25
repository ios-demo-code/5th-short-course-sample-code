//
//  UserListTableViewController.swift
//  CoreDataDemo
//
//  Created by Soeng Saravit on 6/29/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class UserListTableViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var users:[User]?

    override func viewDidLoad() {
        super.viewDidLoad()
              
    }

    override func viewWillAppear(_ animated: Bool) {
        getUsers()
        tableView.reloadData()
    }
    
    func getUsers() {
        users = try? context.fetch(User.fetchRequest())
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let userlist = users else {
            return 0
        }
        return userlist.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = users?[indexPath.row].username
        cell.imageView?.image = UIImage(data: (users?[indexPath.row].image)!)

        return cell
    }
 
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            let user = self.users![indexPath.row]
            self.performSegue(withIdentifier: "showEdit", sender: user)
        }
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            let user = self.users![indexPath.row]
            self.context.delete(user)
            
            self.appDelegate.saveContext()
            self.getUsers()
            self.tableView.reloadData()
        }
        return [edit, delete]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEdit" {
            let dest = segue.destination as! ViewController
            dest.user = sender as? User
        }
    }

}
