//
//  CatInfo.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/18/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import Foundation

struct CatInfo: Decodable {
    let breeds: [Breed]
    let url: String
}

struct Breed: Decodable {
    let weight: Weight
    let id: String
    let name: String
    let temperament, origin: String
    let description, life_span: String
    let wikipedia_url: String?
}

struct Weight: Decodable {
    let metric: String
}
