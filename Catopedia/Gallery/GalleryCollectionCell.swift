//
//  GalleryCollectionCell.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/14/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import UIKit

class GalleryCollectionCell: UICollectionViewCell {

// MARK: - Variables
    let count = 3
    let offset:CGFloat = 2.0
    
// MARK: - Outlets
    @IBOutlet weak var photoImage: UIImageView!
    
    
// MARK: - Functions
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        var frame = layoutAttributes.frame
        frame.size.width = UIScreen.main.bounds.width / CGFloat(count) - 1 - offset/CGFloat(count)
        frame.size.height = frame.size.width - offset
        layoutAttributes.frame = frame
        return layoutAttributes
    }

}
