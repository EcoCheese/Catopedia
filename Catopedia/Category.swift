//
//  Category.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/9/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import Foundation
import UIKit

class Category {
    var icon: UIImage
    var title: String
    var descr: String
    
    init(icon: UIImage, title: String, descr: String){
        self.icon = icon
        self.title = title
        self.descr = descr
    }
}
