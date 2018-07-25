//
//  ViewController.swift
//  UIAlertController-Demo
//
//  Created by Soeng Saravit on 6/14/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var alertController: UIAlertController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlertButtonPressed(_ sender: Any) {
//        simpleAlert()
//        alertWithTextField()
        actionSheetAlert()
    }
    
    func simpleAlert() {
        alertController = UIAlertController(title: "Simple Alert", message: "This is simple alert", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (alert) in
            print("OK")
        }
        alertController?.addAction(okAction)
        self.present(alertController!, animated: true, completion: nil)
    }
    
    func alertWithTextField() {
        alertController = UIAlertController(title: nil, message: "Please input username and password", preferredStyle: .alert)
        alertController?.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Username"
        })
        
        alertController?.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancel")
        }
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            let username = self.alertController?.textFields![0].text
            let pwd = self.alertController?.textFields![1].text
            
            print("\(username!):\(pwd!)")
        }
        
        alertController?.addAction(cancelAction)
        alertController?.addAction(okAction)
        
        self.present(alertController!, animated: true, completion: nil)
    }
    
    func actionSheetAlert() {
        alertController = UIAlertController(title: nil, message: "Do you want to log out", preferredStyle: .actionSheet)
        
        
        let okAction = UIAlertAction(title: "Log Out", style: .destructive) { (alert) in
            print("OK")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
            print("Cancel")
        }
        alertController?.addAction(okAction)
        alertController?.addAction(cancelAction)
        self.present(alertController!, animated: true, completion: nil)
    }

}

