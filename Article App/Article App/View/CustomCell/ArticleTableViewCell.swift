//
//  ArticleTableViewCell.swift
//  Article App
//
//  Created by Soeng Saravit on 7/17/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var createdDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(article:Article) {
        if let title = article.title {
            self.titleLabel.text = title
        }
        
        if let category = article.category?.name {
            self.categoryLabel.text = category
        }else {
            self.categoryLabel.text = "Others"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        
        if let date = dateFormatter.date(from:article.createdDate!) {
            let newDateFormatter = DateFormatter()
            newDateFormatter.dateFormat = "dd-MMM-yyyy HH:mm:ss"
            self.createdDateLabel.text = newDateFormatter.string(from: date)
        }
        
        if let image = article.image {
            if let url = URL(string: image){
                self.articleImageView.kf.setImage(with: url)
            }
        }
    }
}










