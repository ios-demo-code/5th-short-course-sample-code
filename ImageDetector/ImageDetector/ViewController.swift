//
//  ViewController.swift
//  ImageDetector
//
//  Created by Soeng Saravit on 7/23/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController {

    @IBOutlet weak var imgeView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func pickImageButton(_ sender: Any) {
         let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { (action) in
            
            self.browseImage(sourceType: .camera)
        }
        let photoLibrary = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            
            self.browseImage(sourceType: .photoLibrary)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
  
        }
        alert.addAction(camera)
        alert.addAction(photoLibrary)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    func browseImage(sourceType: ImagePickerSourceType) {
        
        let imagePickerView = UIImagePickerController()
       
        if sourceType == .camera {
            imagePickerView.sourceType = .camera
        }else if sourceType == .photoLibrary {
            imagePickerView.sourceType = .photoLibrary
        }
        
        imagePickerView.allowsEditing = false
        imagePickerView.delegate = self
        
        self.present(imagePickerView, animated: true, completion: nil)
    }
    
    func detectObject(ciImage: CIImage) {
        
        self.resultLabel.text = "detecting object..."
        
        let model = try? VNCoreMLModel(for: SqueezeNet().model)
        
        let request = VNCoreMLRequest(model: model!) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation], let topResult = results.first else{
                fatalError("error")
            }
            self.resultLabel.text = "\(Int(topResult.confidence*100))%, It's \(topResult.identifier)"
        }
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        do {
            try handler.perform([request])
        }catch{
            print(error)
        }
        
    }
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("can't load image")
        }
        self.imgeView.image = image
        self.dismiss(animated: true, completion: nil)
        let ciImage = CIImage(image: image)
        self.detectObject(ciImage: ciImage!)
    }
}

enum ImagePickerSourceType {
    case camera
    case photoLibrary
}
