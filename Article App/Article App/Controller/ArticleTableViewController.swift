//
//  ArticleTableViewController.swift
//  Article App
//
//  Created by Soeng Saravit on 7/17/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit
import SVProgressHUD
import PagingTableView

class ArticleTableViewController: UITableViewController {
    
    var articlePresenter:ArticlePresenter?
    var articles:[Article]?
    var n = 1
    @IBOutlet var pagingTableView: PagingTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        articles = [Article]()
        self.articlePresenter = ArticlePresenter()
        self.articlePresenter?.delegate = self
        self.articlePresenter?.getArticles(page: n, limit: 15)
        
        SVProgressHUD.show()
        SVProgressHUD.setBackgroundColor(UIColor.black)
        SVProgressHUD.setForegroundColor(UIColor.white)
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(self.refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        pagingTableView.pagingDelegate = self
        
       
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let articles = self.articles {
            return articles.count
        }
        return 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleTableViewCell
        
        cell.configureCell(article: self.articles![indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let edit = UITableViewRowAction(style: .normal, title: "EDIT") { (action, index) in
            let article = self.articles![index.row]
            self.performSegue(withIdentifier: "showEdit", sender: article)
        }
        
        let delete = UITableViewRowAction(style: .destructive, title: "DELETE") { (action, index) in
            let id = self.articles![index.row].id
            self.articlePresenter?.deleteArticle(id: id!)
        }
        
        return [edit, delete]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEdit" {
            let dest = segue.destination as! AddEditArticleViewController
            dest.detailArticle = sender as? Article
        }
    }
    
    @objc func refreshData(){
        n = 1
        self.pagingTableView.reset()
        self.articlePresenter?.getArticles(page: n, limit: 15)
    }
}

extension ArticleTableViewController: ArticlePresenterDelegate {
    func responseMessage(msg: String) {
        let alert = UIAlertController(title: "DONE", message: msg, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            self.refreshData()
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func responseArticles(articles: [Article]) {
        if n == 1 {
            self.articles = []
            refreshControl?.endRefreshing()
        }else {
            pagingTableView.isLoading = false
        }
        self.articles = self.articles! + articles
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
            self.tableView.reloadData()
        }
    }
}

extension ArticleTableViewController:PagingTableViewDelegate {
    func paginate(_ tableView: PagingTableView, to page: Int) {
        if page >= 1 {
            n = n + 1
            pagingTableView.isLoading = true
            self.articlePresenter?.getArticles(page: n, limit: 15)
        }
    }
}










