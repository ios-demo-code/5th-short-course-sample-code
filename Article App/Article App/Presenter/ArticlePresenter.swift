//
//  ArticlePresenter.swift
//  Article App
//
//  Created by Soeng Saravit on 7/18/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import Foundation

class ArticlePresenter {
    var delegate:ArticlePresenterDelegate?
    var articleService:ArticleService?
    
    init() {
        self.articleService = ArticleService()
        self.articleService?.delegate = self
    }
    func getArticles(page:Int, limit:Int) {
        self.articleService?.getArticles(page: page, limit: limit)
    }
    
    func insertUpdate(article:Article, image:Data) {
        self.articleService?.insertUpdateArticle(article: article, image: image)
    }
    
    func deleteArticle(id:Int) {
        self.articleService?.deleteArticle(id: id)
    }
}

extension ArticlePresenter: ArticleServiceDelegate {
    func responseMessage(msg: String) {
        self.delegate?.responseMessage(msg: msg)
    }
    
    func responseArticles(articles: [Article]) {
        self.delegate?.responseArticles(articles: articles)
    }
}
