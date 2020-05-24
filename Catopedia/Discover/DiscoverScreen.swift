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
    
    
    var listOfCats = [CatInfo]()
    var bufferedList = [CatInfo]()
    var imageLoader = ImageCacheLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bufferedList = listOfCats
        
        catsCollectionView.delegate = self
        catsCollectionView.dataSource = self
        catsSearchBar.delegate = self
        
        
        catsCollectionView.register(UINib(nibName: "CatCardCell", bundle: nil), forCellWithReuseIdentifier: "catCardCell")
        catsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 35, right: 0)
        
    

    }
    

}

// MARK: - Collection View

extension DiscoverScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfCats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = catsCollectionView.dequeueReusableCell(withReuseIdentifier: "catCardCell", for: indexPath) as! CatCardCell
        let cat = listOfCats[indexPath.row]
        
        
        
        cell.catNameLabel.text = cat.breeds[0].name

        
        imageLoader.obtainImageWithPath(imagePath: cat.url) { (image) in

            if let cell = collectionView.cellForItem(at: indexPath) as? CatCardCell {
                cell.catImage.image = image
            }
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = catsCollectionView.cellForItem(at: indexPath) as! CatCardCell
        
        if cell.catImage.image != nil {
        
            let cat = listOfCats[indexPath.row]

            let vc = storyboard?.instantiateViewController(identifier: "catInspectScreen") as! CatInspectScreen
            

            vc.oneCat.append(cat.breeds[0].description)
            vc.oneCat.append(cat.breeds[0].temperament)
            vc.oneCat.append(cat.breeds[0].origin)
            vc.oneCat.append(cat.breeds[0].weight.metric + " kgs")
            vc.oneCat.append(cat.breeds[0].life_span + " yrs")
            vc.oneCat.append(cat.breeds[0].name)
            vc.oneCat.append(cat.breeds[0].wikipedia_url ?? "")
            
            vc.catImagePhoto = cell.catImage.image!

            self.present(vc, animated: true)
        }
        
    }

}

extension DiscoverScreen: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.listOfCats.removeAll()
        
        for item in self.bufferedList {
            if item.breeds[0].name.lowercased().contains(catsSearchBar.text!.lowercased()) {
                self.listOfCats.append(item)
            }
        }
        
        if catsSearchBar.text!.isEmpty {
            self.listOfCats = self.bufferedList
        }
        
        self.catsSearchBar.endEditing(true)
        self.catsCollectionView.reloadData()
    }
    
}



