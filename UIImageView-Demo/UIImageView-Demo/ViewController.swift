//
//  ViewController.swift
//  UIImageView-Demo
//
//  Created by Soeng Saravit on 6/6/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let url = URL(string: "https://images.unsplash.com/photo-1496348323715-c11f0fc6aeed?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c0ca46c79b905ff053eb904a86c3b1cc&auto=format&fit=crop&w=694&q=80")
//        var data:Data? = nil
//        do{
//            data = try Data(contentsOf: url!)
//        }catch {}
//
////        let image = UIImage(named: "Apple")
//        let image = UIImage(data: data!)
//        myImageView.image = image
        showAnimatedImages()
        
    }
    
    
    func showAnimatedImages() {
        
        let images = [#imageLiteral(resourceName: "Apple"), #imageLiteral(resourceName: "Apricot"), #imageLiteral(resourceName: "Banana"), #imageLiteral(resourceName: "Blueberry"), #imageLiteral(resourceName: "Cantaloupe")]
        
        self.myImageView.animationImages = images
        self.myImageView.animationDuration = 10.0
        
        self.myImageView.startAnimating()
    }

}
















