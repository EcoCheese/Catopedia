//
//  FullPhotoScreen.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/14/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import UIKit

class FullPhotoScreen: UIViewController {
    
// MARK: - Variables
    
    var image = UIImage()
    
// MARK: - Outlets
    
    @IBOutlet weak var fullSizeImage: UIImageView!

// MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let singleTapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        
        singleTapGesture.numberOfTapsRequired = 1
        
        self.view.addGestureRecognizer(singleTapGesture)
        
        fullSizeImage.image = image
    }
    
// MARK: - Functions
    
    @objc func singleTap(){
        self.dismiss(animated: true)
    }
}

