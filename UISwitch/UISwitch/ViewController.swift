//
//  ViewController.swift
//  UISwitch
//
//  Created by Soeng Saravit on 6/7/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func switchValueChanged(_ sender: Any) {
        if mySwitch.isOn {
            statusLabel.text = "Switch is off."
            mySwitch.setOn(false, animated: true)
        }else {
            statusLabel.text = "Switch is on."
            mySwitch.setOn(true, animated: true)
        }
        
    }
}

