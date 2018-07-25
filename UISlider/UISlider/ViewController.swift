//
//  ViewController.swift
//  UISlider
//
//  Created by Soeng Saravit on 6/7/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var mySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sliderValueChanged(_ sender: Any) {
        
        let value = mySlider.value
        self.valueLabel.text = String(format: "%.2f", value)
    }
    

}

