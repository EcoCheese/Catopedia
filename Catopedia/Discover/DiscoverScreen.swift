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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        catsCollectionView.delegate = self
        catsCollectionView.dataSource = self
        
//        discoverTableView.allowsSelection = false
        
        catsCollectionView.register(UINib(nibName: "CatCardCell", bundle: nil), forCellWithReuseIdentifier: "catCardCell")
        catsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 35, right: 0)
        
    
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
        
        cell.catNameLabel.text = cat.breeds[0].name
        cell.catImage.load(url: URL(string: cat.url)!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cat = listOfCats[indexPath.row]

        let vc = storyboard?.instantiateViewController(identifier: "catInspectScreen") as! CatInspectScreen
        let cell = catsCollectionView.cellForItem(at: indexPath) as! CatCardCell

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



