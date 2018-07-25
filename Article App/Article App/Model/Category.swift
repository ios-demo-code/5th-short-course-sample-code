//
//  Category.swift
//  Article App
//
//  Created by Soeng Saravit on 7/17/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import Foundation
import SwiftyJSON

class Category {
    var id:Int?
    var name:String?
    
    init() {}
    
    init(json:JSON) {
        self.id = json["ID"].int
        self.name = json["NAME"].string
    }
}
