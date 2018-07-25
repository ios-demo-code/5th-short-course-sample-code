//
//  Article.swift
//  Article App
//
//  Created by Soeng Saravit on 7/17/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import Foundation
import SwiftyJSON

class Article {
    
    var id:Int?
    var title:String?
    var description:String?
    var createdDate:String?
    var category:Category?
    var image:String?
    
    init() {}
    
    init(json:JSON) {
        self.id = json["ID"].int
        self.title = json["TITLE"].string
        self.description = json["DESCRIPTION"].string
        self.createdDate = json["CREATED_DATE"].string
        self.category = Category(json: json["CATEGORY"])
        self.image = json["IMAGE"].string
    }
}
