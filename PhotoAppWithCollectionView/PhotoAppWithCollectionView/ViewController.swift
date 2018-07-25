//
//  ViewController.swift
//  PhotoAppWithCollectionView
//
//  Created by Soeng Saravit on 6/26/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var photoGalleries = [
        ["f1", "f2", "f3", "f4","f5","f6", "f7", "f8", "f8"],
        ["n1", "n2", "n3", "n4", "n5","n6", "n7", "n8"],
        ["fo1", "fo2", "fo3", "fo4", "fo5","fo6", "fo7", "fo8"]
    ]
    var titles:[String] = ["Family", "Nature", "Food"]
    
    var cellPadding:CGFloat = 4.0
    var numberOfItems:CGFloat = 4.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
    
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        // Define layout of Collection View
        
        let collectionWidth = self.view.bounds.size.width
        
        let itemWidth = (collectionWidth - cellPadding) / numberOfItems
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return photoGalleries.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGalleries[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell
        cell.photoImageView.image = UIImage(named: photoGalleries[indexPath.section][indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "photoHeader", for: indexPath) as! PhotoHeaderCollectionReusableView
        header.titleLabel.text = titles[indexPath.section]
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoName = photoGalleries[indexPath.section][indexPath.item]
        self.performSegue(withIdentifier: "showPhoto", sender: photoName)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhoto" {
            let photoName = sender as? String
            let dest = segue.destination as! ShowPhotoViewController
            dest.photoName = photoName
        }
    }

}

