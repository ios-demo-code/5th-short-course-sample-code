//
//  ArticleService.swift
//  Article App
//
//  Created by Soeng Saravit on 7/18/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ArticleService {
    var delegate:ArticleServiceDelegate?
    let BASE_URL = "http://api-ams.me"
    
    let headers = [
        "Accept":"application/json",
        "Content-Type":"application/json"
    ]
    
    func getArticles(page:Int, limit:Int) {
        let getArticleURL = "\(BASE_URL)/v1/api/articles?page=\(page)&limit=\(limit)"
        
        Alamofire.request(getArticleURL, method: .get, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            if response.result.isSuccess {
                let json = JSON(data: response.data!)
                
                var articles = [Article]()
                
                for jsonObject in json["DATA"].array! {
                    articles.append(Article(json: jsonObject))
                }
                self.delegate?.responseArticles(articles: articles)
            }
        }
    }
    
    func insertUpdateArticle(article:Article, image:Data) {
        let uploadImageURL = "\(BASE_URL)/v1/api/uploadfile/single"
        
        Alamofire.upload(multipartFormData: { (multiPart) in
            multiPart.append(image, withName: "FILE", fileName: ".jpg", mimeType: "image/jpeg")
        }, to: uploadImageURL,method:.post, headers:headers) { (encodingResult) in
            switch encodingResult {
            case .success(request: let request, streamingFromDisk: _, streamFileURL: _):
                request.responseJSON(completionHandler: { (response) in
                    if response.result.isSuccess {
                        let json = JSON(data: response.data!)
                        let image = json["DATA"].string
                        article.image = image!
                        if article.id == 0 {
                            self.insertArticle(article: article)
                        }else {
                            self.updateArticle(article: article)
                        }
                    }
                })
            case .failure(let err):
                fatalError(err.localizedDescription)
            }
        }
    }
    
    func insertArticle(article:Article) {
        let postArticleURL = "\(BASE_URL)/v1/api/articles"
        let parameters:[String:Any] = [
            "TITLE": article.title!,
            "DESCRIPTION": article.description!,
            "AUTHOR": 1,
            "CATEGORY_ID": 1,
            "STATUS": "1",
            "IMAGE": article.image!
        ]
        
        Alamofire.request(postArticleURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            if response.result.isSuccess {
                self.delegate?.responseMessage(msg: "Insert Success!")
            }
        }
    }
    
    func updateArticle(article:Article) {
        let putArticleURL = "\(BASE_URL)/v1/api/articles/\(article.id!)"
        let parameters:[String:Any] = [
            "TITLE": article.title!,
            "DESCRIPTION": article.description!,
            "AUTHOR": 1,
            "CATEGORY_ID": 1,
            "STATUS": "1",
            "IMAGE": article.image!
        ]
        
        Alamofire.request(putArticleURL, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            if response.result.isSuccess {
                self.delegate?.responseMessage(msg: "Update Success!")
            }
        }
    }
    
    func deleteArticle(id:Int) {
        let deleteArticleURL = "\(BASE_URL)/v1/api/articles/\(id)"
        
        Alamofire.request(deleteArticleURL, method: .delete, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            if response.result.isSuccess{
                self.delegate?.responseMessage(msg: "Delete Success!")
            }
        }
    }
}













