//
//  LocalizedManeger.swift
//  TestLocalization
//
//  Created by Soeng Saravit on 7/6/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import Foundation


class LanguageManeger {
    
    static var shard = LanguageManeger()
    var language : String
    {
        set
        {
            UserDefaults.standard.set(newValue, forKey: "LanguageCode")
        }
        get
        {
            if let data = UserDefaults.standard.string(forKey: "LanguageCode")
            {
                let languageCode = data.lowercased()
                return languageCode
            }
            else
            {
                return self.language
            }
            
            
        }
        
    }
    
    
}

extension String
{
    var localized : String
    {
        get
        {
            if let LanguageCode = UserDefaults.standard.string(forKey: "LanguageCode")
            {
            let bundlePath = Bundle.main.path(forResource: LanguageCode, ofType: "lproj")
                let languageBunde = Bundle(path: bundlePath!)
                
            let translateString = languageBunde?.localizedString(forKey: self, value: "", table: nil)
                
                return translateString!
                
            }else
            {
                return ""
            }
        }
    }
}
