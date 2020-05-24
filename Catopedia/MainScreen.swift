//
//  MainScreen.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/9/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    
// MARK: - Variables
    
    var categories = [Category]()
    var sorted = [CatInfo]()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
// MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backgroundView: RoundView!
    
// MARK: - API Loading
    
    var listOfCats = [CatInfo](){
        didSet {
            DispatchQueue.main.async {
                print("found \(self.listOfCats.count) images")
            }
        }
    }
    
    var listOfIDs = [CatIDs]() {
        didSet {
            DispatchQueue.main.async{
                print("found \(self.listOfIDs.count) cats")
                for i in 0 ..< self.listOfIDs.count {
                    let imageRequest = CatInfoRequest(id: self.listOfIDs[i].id)
                    imageRequest.getCats(){ [weak self] result in
                        switch result {
                        case .failure(let error):
                            print(error)
                        case .success(let cat):
                            self?.listOfCats.append(cat.last!)
                        }
                    }
                }
            }
        }
    }
    
// MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let idRequest = IDRequest()
        
        idRequest.getCats() { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let id):
                self?.listOfIDs = id
            }
        }
        
        backgroundView.setGradient(colorOne: UIColor(red: 227.0/255.0, green: 192.0/255.0, blue: 255.0/255.0, alpha: 1.0), colorTwo: UIColor(red: 255.0/255.0, green: 194.0/255.0, blue: 194.0/255.0, alpha: 1.0))
        
        categories = createArray()        
        
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
// MARK: - Functions
    
    func createArray() -> [Category] {
        
        var tempArray: [Category] = []
        
        let category1 = Category(icon: #imageLiteral(resourceName: "icon1"), title: "Discover Cats", descr: "Get the entire list of cat breeds and all of their specialtities")
        let category2 = Category(icon: #imageLiteral(resourceName: "icon2"), title: "Guess Cats", descr: "Try yourself on guessing cat breeds by the photo")
        let category3 = Category(icon: #imageLiteral(resourceName: "icon3"), title: "Cat Gallery", descr: "Enjoy an incredible collection of cat images")
        
        tempArray.append(category1)
        tempArray.append(category2)
        tempArray.append(category3)
        
        return tempArray
    }
}


// MARK: - CollectionView

extension MainScreen: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = categories[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainScreenCell", for: indexPath) as! MainScreenCell
        
        cell.getCategory(category: category)
        
        cell.contentView.layer.cornerRadius = 20.0
        

        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false

        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        if indexPath.row == 0 {
            
            if listOfCats.count == listOfIDs.count {
            
                if sorted.count < listOfCats.count {
                    sorted = listOfCats
                    
                    for i in 0...listOfCats.count-1 {
                        for j in 0...listOfIDs.count-1 {
                            if listOfCats[i].breeds[0].id == listOfIDs[j].id {
                                sorted[j] = listOfCats[i]
                            }
                        }
                    }
                }
                
                let vc = storyboard?.instantiateViewController(identifier: "discoverScreen") as! DiscoverScreen
                vc.listOfCats = sorted
                
                self.present(vc, animated: true)
            }
            
        } else if indexPath.row == 1{
            let vc = storyboard?.instantiateViewController(identifier: "guessScreen") as! GuessScreen
            vc.listOfCats = listOfCats
            
            self.present(vc, animated: true)
            
        } else {
            performSegue(withIdentifier: "GalleryView", sender: self)
        }
    }
}
