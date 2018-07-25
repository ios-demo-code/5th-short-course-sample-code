//
//  settingViewController.swift
//  TestLocalization
//
//  Created by Soeng Saravit on 7/6/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class settingViewController: UIViewController {

    @IBOutlet weak var changeLanguageButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        changeLanguageButton.setTitle("change-button".localized
            , for: .normal)
 
    }

    @IBAction func changeLanguageButtonAction(_ sender: Any) {
        if LanguageManeger.shard.language == "en"
        {
            LanguageManeger.shard.language = "km"
        }
        else if LanguageManeger.shard.language == "km"
        {
            LanguageManeger.shard.language = "en"
        }
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let initailViewcontroller = storyBoard.instantiateInitialViewController()
        appDelegate.window?.rootViewController = initailViewcontroller
        
        
    }
    
}
