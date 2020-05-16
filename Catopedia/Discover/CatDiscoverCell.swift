//
//  CatDiscoverCell.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/12/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import UIKit

class CatDiscoverCell: UITableViewCell {
    
    @IBOutlet weak var leftView: RoundView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var leftLabelView: UIView!
    @IBOutlet weak var leftLabel: UILabel!
    
    
    @IBOutlet weak var rightView: RoundView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var rightLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let leftSingleTapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(leftTap))
        let rightSingleTapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(rightTap))
        
        leftSingleTapGesture.numberOfTapsRequired = 1
        rightSingleTapGesture.numberOfTapsRequired = 1
        
        leftView.addGestureRecognizer(leftSingleTapGesture)
        rightView.addGestureRecognizer(rightSingleTapGesture)
        
        selectionStyle = .none
        
        
        // Initialization code
    }
    
    @objc func leftTap(){
        print("kekleft")
    }
    
    @objc func rightTap(){
        print("kekright")
    }

    
    
}


