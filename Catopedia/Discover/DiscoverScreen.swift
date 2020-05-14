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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        discoverTableView.delegate = self
        discoverTableView.dataSource = self
        
        discoverTableView.register(UINib(nibName: "CatDiscoverCell", bundle: nil), forCellReuseIdentifier: "catDiscoverCell")
        // Do any additional setup after loading the view.
    }
    

}

extension DiscoverScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var value = 3
        
        return value
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catDiscoverCell", for: indexPath) as! CatDiscoverCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "inspectSegue", sender: self)
        
    }
    
    
    
    
}

