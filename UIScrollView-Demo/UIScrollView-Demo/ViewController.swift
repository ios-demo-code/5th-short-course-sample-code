//
//  ViewController.swift
//  UIScrollView-Demo
//
//  Created by Soeng Saravit on 6/14/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView:UIScrollView?
    var imageView:UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addScrollView()
    }

    func addScrollView() {
        scrollView = UIScrollView(frame: self.view.bounds)
        scrollView?.backgroundColor = UIColor.black
        scrollView?.alwaysBounceVertical = false
        scrollView?.alwaysBounceHorizontal = false
        scrollView?.flashScrollIndicators()
 
        imageView = UIImageView(image: #imageLiteral(resourceName: "joep-cox-485712-unsplash"))
        scrollView?.contentSize = (imageView?.bounds.size)!
        scrollView?.contentOffset = CGPoint(x: 1000, y: 500)
        scrollView?.addSubview(imageView!)
        
        scrollView?.minimumZoomScale = 0.1
        scrollView?.maximumZoomScale = 3
        
        scrollView?.delegate = self
        
        self.view.addSubview(scrollView!)
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView!
    }

}

