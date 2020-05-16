//
//  Cat.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/16/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import Foundation

import Foundation

//struct CatBreed:Decodable {
//    var breeds:CatDetail
//    var id:String
//    var url:String
//}

struct CatDetail:Decodable {
    var name:String
    var origin:String
    var weight:CatWeight
}

struct CatWeight:Decodable {
    var metric:String
}
