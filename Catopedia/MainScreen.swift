//
//  MainScreen.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/9/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    
    var categories = [Category]()
    var viewArray = [String]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradient(colorOne: UIColor(red: 227.0/255.0, green: 192.0/255.0, blue: 255.0/255.0, alpha: 1.0), colorTwo: UIColor(red: 255.0/255.0, green: 194.0/255.0, blue: 194.0/255.0, alpha: 1.0))
        
        categories = createArray()
        viewArray = ["DiscoverView","GuessView","GalleryView"]
        
        
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
    func createArray() -> [Category] {
        
        var tempArray: [Category] = []
        
        let category1 = Category(icon: #imageLiteral(resourceName: "icon1"), title: "Discover Cats", descr: "Get the entire list of cat breeds and all of their specialtities")
        let category2 = Category(icon: #imageLiteral(resourceName: "icon2"), title: "Guess Cats", descr: "Try yourself on guessing cat breeds by the photo")
        let category3 = Category(icon: #imageLiteral(resourceName: "icon3"), title: "Cat Gallery", descr: "Enjoy watching an incredible collection of cat images")
        
        tempArray.append(category1)
        tempArray.append(category2)
        tempArray.append(category3)
        
        return tempArray
    }
}

extension MainScreen: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = categories[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainScreenCell", for: indexPath) as! MainScreenCell
        
        cell.getCategory(category: category)
        
        cell.contentView.layer.cornerRadius = 20.0
        
        //cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        //cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let id = viewArray[indexPath.row]
        performSegue(withIdentifier: id, sender: self)
        
    }
    
    
}
