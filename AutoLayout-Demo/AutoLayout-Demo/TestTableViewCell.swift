//
//  TestTableViewCell.swift
//  AutoLayout-Demo
//
//  Created by Soeng Saravit on 6/20/18.
//  Copyright © 2018 Soeng Saravit. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {
    @IBOutlet weak var myLabel2: UILabel!
    
    @IBOutlet weak var myLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
