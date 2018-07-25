//
//  ViewController1.swift
//  UIElement-Demo
//
//  Created by Soeng Saravit on 5/23/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func showInfoAction(_ sender: Any) {
        let text = infoTextField.text
        
        infoLabel.text = text
        
    }
    

}
