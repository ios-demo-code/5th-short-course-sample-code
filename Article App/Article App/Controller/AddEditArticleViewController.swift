//
//  AddEditArticleViewController.swift
//  Article App
//
//  Created by Soeng Saravit on 7/19/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit
import Kingfisher

class AddEditArticleViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var articlePresenter:ArticlePresenter?
    
    var detailArticle:Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.articlePresenter = ArticlePresenter()
        self.articlePresenter?.delegate = self
        
        self.navigationItem.largeTitleDisplayMode = .never
        
        if let article = detailArticle {
            self.titleTextField.text = article.title
            self.descriptionTextView.text = article.description
            
            if let image = article.image {
                let url = URL(string: image)
                self.articleImageView.kf.setImage(with: url!)
            }
        }

    }
    @IBAction func browseImageAction(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.browseViaCamera()
        }
        let photo = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            self.browseViaPhoto()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(camera)
        alert.addAction(photo)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func saveArticleAction(_ sender: Any) {
        
        let article = Article()
        if detailArticle == nil {
           article.id = 0
        }else {
            article.id = detailArticle?.id
        }
        
        article.title = self.titleTextField.text
        article.description = self.descriptionTextView.text
        
        let image = UIImageJPEGRepresentation(self.articleImageView.image!, 0.5)
        self.articlePresenter?.insertUpdate(article: article, image: image!)
    }
    
    func browseViaCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    func browseViaPhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
}

extension AddEditArticleViewController: ArticlePresenterDelegate {
    func responseArticles(articles: [Article]) {
        
    }
    
    func responseMessage(msg: String) {
        let alert = UIAlertController(title: "DONE", message: msg, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            self.titleTextField.text = nil
            self.descriptionTextView.text = nil
            self.articleImageView.image = #imageLiteral(resourceName: "default")
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}

extension AddEditArticleViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.articleImageView.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
}
