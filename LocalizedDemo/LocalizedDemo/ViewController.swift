//
//  ViewController.swift
//  LocalizedDemo
//
//  Created by Soeng Saravit on 7/6/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "welcome".localize
        tabBarController?.tabBar.items![0].title = "home".localize
        tabBarController?.tabBar.items![1].title = "setting".localize
    }



}

