//
//  Test.swift
//  AccessLevelDemo
//
//  Created by Soeng Saravit on 5/29/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import Foundation

class Test {
    
    public var id:Int = 0
    
    func getInfo() {
        print(id)
    }
    
}

class Test1 {
    init() {
        var t = Test()
    }
}
