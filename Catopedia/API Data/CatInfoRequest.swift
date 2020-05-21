//
//  CatInfoRequest.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/18/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import Foundation

// MARK: - Error

enum CatInfoError:Error {
    case noDataAvailable
    case canNotProcessData
}

// MARK: - Request

struct CatInfoRequest {
      
    let API_KEY = "475db3af-30c3-4b40-9193-96b8dc99648a"
    let request:URLRequest
    
    var listOfCats = [CatIDs]()
      
    init(id: String) {
        let resourceString = "https://api.thecatapi.com/v1/images/search?breed_ids=\(id)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        var request = URLRequest(url: resourceURL)
        request.addValue(API_KEY, forHTTPHeaderField: "x-api-key")
      
        self.request = request
    }
    
    func getCats(completion: @escaping(Result<[CatInfo], CatInfoError>) -> Void){
        let dataTask = URLSession.shared.dataTask(with: request){data, resp, err in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let catsResponse = try decoder.decode([CatInfo].self, from: jsonData)
                
                completion(.success(catsResponse))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}
