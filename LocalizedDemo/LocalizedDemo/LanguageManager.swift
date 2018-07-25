//
//  LanguageManager.swift
//  LocalizedDemo
//
//  Created by Soeng Saravit on 7/6/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import Foundation

class LanguageManager {
    static let shared = LanguageManager()
    
    var Language : String {
        set {
            UserDefaults.standard.set(newValue, forKey: "LanguageCode")
        }
        get {
            
            if let data = UserDefaults.standard.string(forKey: "LanguageCode") {
            let languageCode = data.lowercased()
            return languageCode
                
            }
                
            else
                
            {
                return self.Language
            }
    }
}
}
    extension String {
        var localize : String {
            get { if let languageCode = UserDefaults.standard.string(forKey: "LanguageCode")
            {
                let bundlePath = Bundle.main.path(forResource: languageCode, ofType: "lproj")
                let languageBundle = Bundle(path: bundlePath!)
                let translatedString = languageBundle?.localizedString(forKey: self, value: "", table: nil)
                
                return translatedString!
                }
            else {
                return ""
                }
        }
    }
}
    

