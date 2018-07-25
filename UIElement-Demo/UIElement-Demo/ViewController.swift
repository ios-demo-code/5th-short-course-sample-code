//
//  ViewController.swift
//  UIElement-Demo
//
//  Created by Soeng Saravit on 5/23/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addLabel()
    }

    func addLabel() {
        
        let label = UILabel(frame: CGRect(x: 70, y: 100, width: 200, height: 20))
        
        label.text = "Welcome to iOS Class!"
        label.textColor = UIColor.blue
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = NSTextAlignment.center
        
        self.view.addSubview(label)
    }


}

