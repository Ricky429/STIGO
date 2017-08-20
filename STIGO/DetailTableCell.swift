//
//  DetailTableCell.swift
//  STIGO
//
//  Created by Erik Hemingway on 8/19/17.
//  Copyright © 2017 Erik Hemingway. All rights reserved.
//

import UIKit

class DetailTableCell: UITableViewCell {
    
    @IBOutlet weak var cellTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
