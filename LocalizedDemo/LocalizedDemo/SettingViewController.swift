//
//  SettingViewController.swift
//  LocalizedDemo
//
//  Created by Soeng Saravit on 7/6/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var titleButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleButton.setTitle("title-button".localize, for: .normal)
        
    }

    @IBAction func changeLanguageButton(_ sender: Any) {
        
        if LanguageManager.shared.Language == "en" {
            LanguageManager.shared.Language = "km"
        } else if LanguageManager.shared.Language == "km" {
                LanguageManager.shared.Language = "en"
            }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let initViewController = storyBoard.instantiateInitialViewController()
        
        appDelegate.window?.rootViewController = initViewController
        
        }
    }
    

