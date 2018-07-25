//
//  ViewController.swift
//  Delegate-Demo
//
//  Created by Soeng Saravit on 6/15/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ProcessDelegate {
    
    

    @IBOutlet weak var statusLabel: UILabel!
    var process:Process?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = "Processing ..."
        
        self.process = Process()
        self.process?.startProcess()
        self.process?.delegate = self
    }
    
    func didFinishTask(msg: String) {
        self.statusLabel.text = msg
    }
    

}

