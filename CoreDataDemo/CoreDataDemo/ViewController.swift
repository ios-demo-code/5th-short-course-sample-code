//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Soeng Saravit on 6/29/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var user:User?
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.largeTitleDisplayMode = .never
        self.imagePicker.delegate = self
        
        if user != nil {
            self.usernameTextField.text = user?.username
            self.imageView.image = UIImage(data: (user?.image)!)
        }
    }


    @IBAction func addToListButtonAction(_ sender: Any) {
        let img = UIImageJPEGRepresentation(self.imageView.image!, 0.5)
        
        if self.user != nil {
            let id = user?.objectID
            let userUpdate = findUser(id: id!)
            userUpdate?.username = usernameTextField.text
            userUpdate?.image = img
        }else {
            
            let user = User(context: context)
            user.username = self.usernameTextField.text
            user.image = img
        }
        
        appDelegate.saveContext()
        self.navigationController?.popViewController(animated: true)
    }
    
    func findUser(id:NSManagedObjectID) -> User? {
        if let user = context.object(with: id) as? User {
            return user
        }
        return nil
    }
    
    @IBAction func browseImage(_ sender: Any) {
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
}



