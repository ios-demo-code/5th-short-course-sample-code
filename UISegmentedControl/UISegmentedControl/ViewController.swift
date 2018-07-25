//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Soeng Saravit on 6/7/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var colorView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func segmentedControlValueChanged(_ sender: Any) {
        let index = segmentedControl.selectedSegmentIndex
        
        if index == 0 {
            self.colorView.backgroundColor = UIColor.red
        }else if index == 1 {
            self.colorView.backgroundColor = UIColor.blue
        }else if index == 2 {
            self.colorView.backgroundColor = UIColor.green
        }
        
    }
    

}

