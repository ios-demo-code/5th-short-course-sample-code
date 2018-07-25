//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by Soeng Saravit on 6/28/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let index = UserDefaults.standard.integer(forKey: "colorIndex")
        self.segmentedControl.selectedSegmentIndex = index
        changeViewBGColor(index: index)

    }

    @IBAction func colorSegmentedControlAction(_ sender: Any) {
        let index = segmentedControl.selectedSegmentIndex
        UserDefaults.standard.set(index, forKey: "colorIndex")
        changeViewBGColor(index: index)
    }
    
    func changeViewBGColor(index:Int) {
        if index == 0 {
            colorView.backgroundColor = UIColor.green
        } else if index == 1 {
            colorView.backgroundColor = UIColor.red
        } else if index == 2 {
            colorView.backgroundColor = UIColor.yellow
        }
    }
}

