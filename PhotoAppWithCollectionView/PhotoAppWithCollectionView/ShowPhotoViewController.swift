//
//  ShowPhotoViewController.swift
//  PhotoAppWithCollectionView
//
//  Created by Soeng Saravit on 6/27/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class ShowPhotoViewController: UIViewController {
    

    @IBOutlet weak var photoImageView: UIImageView!
    
    var photoName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if photoName != nil {
            photoImageView.image = UIImage(named: photoName!)
        }
    }

}
