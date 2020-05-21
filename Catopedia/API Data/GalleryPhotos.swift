//
//  GalleryPhotos.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/17/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import Foundation

// MARK: - Data

struct GalleryPhotos:Decodable {
    let url:String
}

// MARK: - Error

enum GalleryError:Error {
    case noGalleryDataAvailable
    case canNotProcessGalleryData
}

// MARK: - Request

struct GalleryRequest {
    
    let API_KEY = "475db3af-30c3-4b40-9193-96b8dc99648a"
    let request:URLRequest
    
    init() {
        let resourceString = "https://api.thecatapi.com/v1/images/search?limit=15"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        var request = URLRequest(url: resourceURL)
        request.addValue(API_KEY, forHTTPHeaderField: "x-api-key")
        
        self.request = request
    }
    
    func getPhotos(completion: @escaping(Result<[GalleryPhotos], GalleryError>) -> Void){
        let dataTask = URLSession.shared.dataTask(with: request){data, resp, err in
            guard let jsonData = data else {
                completion(.failure(.noGalleryDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let galleryResponse = try decoder.decode([GalleryPhotos].self, from: jsonData)
                
                completion(.success(galleryResponse))
            } catch {
                completion(.failure(.canNotProcessGalleryData))
            }
        }
        dataTask.resume()
    }
}
