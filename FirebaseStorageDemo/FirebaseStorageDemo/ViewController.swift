//
//  ViewController.swift
//  FirebaseStorageDemo
//
//  Created by Soeng Saravit on 7/3/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit
import FirebaseStorage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.imagePicker.delegate = self
    }

    @IBAction func browseImage(_ sender: Any) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.browseViaCamera()
        }
        
        let photoLibrary = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            self.browseViaPhotoLibrary()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        
        alertController.addAction(camera)
        alertController.addAction(photoLibrary)
        alertController.addAction(cancel)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func saveToServerAction(_ sender: Any) {
        let img = UIImageJPEGRepresentation(self.imageView.image!, 0.5)
        
        let imgName = UUID().uuidString
        let storageRef = Storage.storage().reference().child("pictures/\(imgName).jpg")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        self.uploadToFirebaseStorage(data: img!, metadata: metadata, storageRef: storageRef)
    }
    
    func browseViaCamera() {
        self.imagePicker.allowsEditing = false
        self.imagePicker.sourceType = .camera
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func browseViaPhotoLibrary() {
        self.imagePicker.allowsEditing = false
        self.imagePicker.sourceType = .photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func uploadToFirebaseStorage(data:Data, metadata:StorageMetadata, storageRef:StorageReference) {
        
        storageRef.putData(data, metadata: metadata) { (metaData, error) in
            if let err = error {
                assertionFailure(err.localizedDescription)
            }else {
                print("==> Image URL: \((metaData?.downloadURL())!.absoluteString)")
                let alertController = UIAlertController(title: "Success!", message: "Your file has been uploaded.", preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    
                })
                
                alertController.addAction(ok)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}

