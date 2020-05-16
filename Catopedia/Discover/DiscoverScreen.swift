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
    @IBOutlet weak var discoverTableView: UITableView!
    
    var listOfCats = [CatDetail]() {
        didSet {
            DispatchQueue.main.async{
                self.discoverTableView.reloadData()
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
        
        discoverTableView.delegate = self
        discoverTableView.dataSource = self
        
        discoverTableView.allowsSelection = false
        
        discoverTableView.register(UINib(nibName: "CatDiscoverCell", bundle: nil), forCellReuseIdentifier: "catDiscoverCell")
        
    
        // Do any additional setup after loading the view.
    }
    

}

extension DiscoverScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listOfCats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catDiscoverCell", for: indexPath) as! CatDiscoverCell
        
        let leftCat = listOfCats[indexPath.row * 2]
        let rightCat = listOfCats[indexPath.row * 2 + 1]
            
        cell.leftLabel.text = leftCat.name
        cell.rightLabel.text = rightCat.name
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "inspectSegue", sender: self)
        
    }
    
    
    
    
}

