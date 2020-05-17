//
//  GalleryScreen.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/12/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import UIKit

class GalleryScreen: UIViewController {

    @IBOutlet weak var galleryCollectionView: UICollectionView!
    

    var photos = [GalleryPhotos]() {
        didSet {
            DispatchQueue.main.async{
                self.galleryCollectionView.reloadData()
                print("found \(self.photos.count) cats")
                
            }
        }
    }
    
    let request = GalleryRequest()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request.getPhotos() { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let allPhotos):
                self?.photos = allPhotos
            }
        }

        galleryCollectionView.dataSource = self
        galleryCollectionView.delegate = self
        
        galleryCollectionView.register(UINib(nibName: "GalleryCollectionCell", bundle: nil), forCellWithReuseIdentifier: "galleryCollectionCell")
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "fullPhotoSegue" {
//
//            let detailsVC = segue.destination as! FullPhotoScreen
//            let cell = sender as! GalleryCollectionCell
//            let indexPaths = self.galleryCollectionView.indexPath(for: cell)
//            detailsVC.image =
//
//        }
//
//    }


}

extension GalleryScreen: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = galleryCollectionView.dequeueReusableCell(withReuseIdentifier: "galleryCollectionCell", for: indexPath) as! GalleryCollectionCell
        
        let ph = photos[indexPath.row]
        
        cell.photoImage.load(url: URL(string: ph.url)!)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = galleryCollectionView.cellForItem(at: indexPath) as! GalleryCollectionCell

        let vc = storyboard?.instantiateViewController(identifier: "fullPhotoScreen") as! FullPhotoScreen
        vc.image = cell.photoImage.image!

        self.present(vc, animated: true)
        
        
    }
    
    

}
