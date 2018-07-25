//
//  ViewController.swift
//  SC-Example-1
//
//  Created by Soeng Saravit on 7/13/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var articles: NSArray?
    let BASE_URL = "http://api-ams.me"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        insertArticle()
//        updateArticle(id: 81051)
        deleteArticle(id: 81051)
        getArticles(page: 1, limit: 15)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if articles == nil {
            return 0
        }
        return (articles?.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath)
        let article = articles![indexPath.row] as! [String:Any]
        if let image = article["IMAGE"] as? String {
            let url = URL(string: image)
            let data = try? Data(contentsOf: url!)
            if let data = data {
                cell.imageView?.image = UIImage(data: data)
            }else{
                cell.imageView?.image = #imageLiteral(resourceName: "default-img")
            }
        }else {
             cell.imageView?.image = #imageLiteral(resourceName: "default-img")
        }
        
        cell.textLabel?.text = article["TITLE"] as? String
       
        return cell
        
    }
    
    
    func getArticles(page:Int, limit:Int) {
        
        let getArticleUrl = "\(BASE_URL)/v1/api/articles?page=\(page)&limit=\(limit)"
        
        let url = URL(string: getArticleUrl)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            if error == nil {
                if let jsonObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any] {
                    self.articles = jsonObject["DATA"] as? NSArray
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }.resume()
        
    }
    
    func insertArticle() {
        let postArticleUrl = "\(BASE_URL)/v1/api/articles"
        
        let data:[String:Any] = [
            "TITLE": "iOS Evening Class",
            "DESCRIPTION": "iOS Evening Class",
            "AUTHOR": 1,
            "CATEGORY_ID": 1,
            "STATUS": "1",
            "IMAGE": "http://api-ams.me:80/image-thumbnails/thumbnail-3417fd89-18b0-4538-a187-afbf2a98e976.jpg"
        ]
        
        let url = URL(string: postArticleUrl)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonData = try? JSONSerialization.data(withJSONObject: data, options: [])
        urlRequest.httpBody = jsonData!
        
        let session = URLSession.shared
        session.dataTask(with: urlRequest) { (data, response, error) in
            if error == nil {
                print("==> Insert article success!")
            }
        }.resume()
    }
   
    func updateArticle(id:Int) {
        let putArticleUrl = "\(BASE_URL)/v1/api/articles/\(id)"
        
        let data:[String:Any] = [
            "TITLE": "iOS Evening Class Updated",
            "DESCRIPTION": "iOS Evening Class",
            "AUTHOR": 1,
            "CATEGORY_ID": 1,
            "STATUS": "1",
            "IMAGE": "http://api-ams.me:80/image-thumbnails/thumbnail-3417fd89-18b0-4538-a187-afbf2a98e976.jpg"
        ]
        
        let url = URL(string: putArticleUrl)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "PUT"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonData = try? JSONSerialization.data(withJSONObject: data, options: [])
        urlRequest.httpBody = jsonData!
        
        let session = URLSession.shared
        session.dataTask(with: urlRequest) { (data, response, error) in
            if error == nil {
                print("==> Update article success!")
            }
            }.resume()
    }
    
    func deleteArticle(id:Int) {
        let putArticleUrl = "\(BASE_URL)/v1/api/articles/\(id)"
        
        let url = URL(string: putArticleUrl)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "DELETE"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
       
        
        let session = URLSession.shared
        session.dataTask(with: urlRequest) { (data, response, error) in
            if error == nil {
                print("==> Delete article success!")
            }
            }.resume()
    }
}
















