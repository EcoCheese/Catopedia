//
//  DiscoverScreen.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/12/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import UIKit

class DiscoverScreen: UIViewController {

    @IBOutlet weak var catsSearchBar: UISearchBar!
    @IBOutlet weak var catsCollectionView: UICollectionView!
    
    var listOfCats = [CatDetail]() {
        didSet {
            DispatchQueue.main.async{
                self.catsCollectionView.reloadData()
                print("found \(self.listOfCats.count) cats")
                
            }
        }
    }
    
    let catRequest = CatRequest()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catRequest.getCats() { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let cats):
                self?.listOfCats = cats
            }
        }
        
        catsCollectionView.delegate = self
        catsCollectionView.dataSource = self
        
//        discoverTableView.allowsSelection = false
        
        catsCollectionView.register(UINib(nibName: "CatCardCell", bundle: nil), forCellWithReuseIdentifier: "catCardCell")
        
    
        // Do any additional setup after loading the view.
    }
    

}

extension DiscoverScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfCats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = catsCollectionView.dequeueReusableCell(withReuseIdentifier: "catCardCell", for: indexPath) as! CatCardCell
        let cat = listOfCats[indexPath.row]
        
        cell.catNameLabel.text = cat.name
        //cell.catImage.load(url: URL(string: "https://cdn2.thecatapi.com/images/search?breed_ids=\(cat.id)")!)
        //    http://api.thecatapi.com/v1/images/search?breed_ids=beng
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "inspectSegue", sender: self)
    }
    

    
    
}



