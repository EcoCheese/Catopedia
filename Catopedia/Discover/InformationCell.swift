//
//  InformationCell.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/16/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import UIKit

class InformationCell: UITableViewCell {

    @IBOutlet weak var informationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
