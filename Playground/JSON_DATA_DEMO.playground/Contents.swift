//: Playground - noun: a place where people can play

import UIKit

let url = Bundle.main.url(forResource: "data", withExtension: "json")

let data = try Data(contentsOf: url!)

let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

if let dic = jsonObject as? [String:Any] {
    let title = dic["title"] as! String
    let version = dic["swiftVersion"] as! Float
    
    print(title)
    print(version)
    
    let users = dic["users"] as! NSArray
    
    for user in users {
        let newuser = user as! [String:Any]
        print(newuser["name"]!)
        print(newuser["age"]!)
    }
}


