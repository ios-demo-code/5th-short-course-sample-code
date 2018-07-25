//
//  ArticleServiceDelegate.swift
//  Article App
//
//  Created by Soeng Saravit on 7/18/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import Foundation

protocol ArticleServiceDelegate {
    func responseArticles(articles:[Article])
    func responseMessage(msg:String)
}
