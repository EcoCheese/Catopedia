//
//  CatCardCell.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/16/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import UIKit

class CatCardCell: UICollectionViewCell {

    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catNameLabel: UILabel!
    @IBOutlet weak var blurredView: UIView!
    
    let count = 2
    let offset:CGFloat = 16.0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        blurredView.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        blurredView.insertSubview(blurView, at: 0)
        
        NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: blurredView.heightAnchor), blurView.widthAnchor.constraint(equalTo: blurredView.widthAnchor)])
        
        // Initialization code
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        var frame = layoutAttributes.frame
        frame.size.width = UIScreen.main.bounds.width / CGFloat(count) - CGFloat(count + 1) * offset / CGFloat(count)
        frame.size.height = frame.size.width
        layoutAttributes.frame = frame
        return layoutAttributes
    }

}
