//
//  Process.swift
//  Delegate-Demo
//
//  Created by Soeng Saravit on 6/15/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import Foundation

class Process{
    
    var delegate:ProcessDelegate?
    
    func startProcess() {
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(finishedProcess), userInfo: nil, repeats: false)
    }
    
    @objc func finishedProcess() {
        self.delegate?.didFinishTask(msg: "Process Completed.")
    }
}

protocol ProcessDelegate {
    func didFinishTask(msg:String)
}
