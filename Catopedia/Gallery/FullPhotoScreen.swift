//
//  FullPhotoScreen.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/14/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import UIKit

class FullPhotoScreen: UIViewController {
    
    @IBOutlet weak var fullSizeImage: UIImageView!

    var image = UIImage()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let singleTapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        
        singleTapGesture.numberOfTapsRequired = 1
        
        self.view.addGestureRecognizer(singleTapGesture)
        
        fullSizeImage.image = image

        // Do any additional setup after loading the view.
    }
    
    @objc func singleTap(){
        self.dismiss(animated: true)
    }

}

