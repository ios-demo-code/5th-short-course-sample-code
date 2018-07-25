//
//  ViewController.swift
//  Demo-App
//
//  Created by Soeng Saravit on 5/8/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textlabel.textColor = UIColor.red

    }

    @IBAction func changeContentLabel(_ sender: Any) {
        
        textlabel.text = "Hi everyone!"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

