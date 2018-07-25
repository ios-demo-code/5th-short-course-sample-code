//
//  SettingViewController.swift
//  LocalizationDemoApp
//
//  Created by Soeng Saravit on 7/5/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        changeButton.setTitle("change-button".localized, for: .normal)
    }

    @IBAction func changeLanguageAction(_ sender: Any) {
        if LanguageManager.shared.language == "en" {
            LanguageManager.shared.language = "km"
        }else if LanguageManager.shared.language == "km" {
            LanguageManager.shared.language = "en"
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let initialViewController = storyBoard.instantiateInitialViewController()
        appDelegate.window?.rootViewController = initialViewController
        
    }
}
