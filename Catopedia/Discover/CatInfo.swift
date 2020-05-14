//
//  CatInfo.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/14/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import Foundation
import UIKit

class Cat {
    var name: String
    var image: UIImage
    
    var info: String
    var temperament: String
    var origin: String
    var weight: String
    var lifeSpan: String
    
    var wikiURL: String
    
    init(name: String, image: UIImage, info: String, temperament: String, origin: String, weight: String, lifeSpan: String, wikiURL: String){
        
        self.name = name
        self.image = image
        self.info = info
        self.temperament = temperament
        self.origin = origin
        self.weight = weight
        self.lifeSpan = lifeSpan
        self.wikiURL = wikiURL
        
        
    }
    
    
}
