//
//  CatInspectScreen.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/14/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import UIKit

class CatInspectScreen: UIViewController {
    
    
    @IBOutlet weak var informationTableView: UITableView!
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func wikiButton(_ sender: Any) {
        UIApplication.shared.open(URL(string: oneCat[7]) as! URL, options: [:], completionHandler: nil)
    }
    
    @IBOutlet weak var catNameLabel: UILabel!
    @IBOutlet weak var catPhoto: UIImageView!
    
    
    var oneCat = [String]()
    var headers = ["Info: ", "Temperament: ", "Origin: ", "Avg weight: ", "Avg life span: "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oneCat.append("The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals")
        oneCat.append("Active, Energetic, Independent, Intelligent, Gentle")
        oneCat.append("Egypt")
        oneCat.append("7 - 10" + " kgs")
        oneCat.append("14 - 15" + " yrs")
        oneCat.append("Abyssinian")
        oneCat.append("https://25.media.tumblr.com/tumblr_m4gjqmNI3m1qhwmnpo1_500.jpg")
        oneCat.append("https://en.wikipedia.org/wiki/Abyssinian_(cat)")
        
        catNameLabel.text = oneCat[5]
        
        informationTableView.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 60, right: 0)
        

        informationTableView.delegate = self
        informationTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    

}

extension CatInspectScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = informationTableView.dequeueReusableCell(withIdentifier: "informationCell", for: indexPath) as! InformationCell
        
        let attr = NSMutableAttributedString(string: "")
        attr.append(NSAttributedString(string: headers[indexPath.row], attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)]))
        attr.append(NSAttributedString(string: oneCat[indexPath.row], attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22)]))
        
        cell.informationLabel.attributedText = attr
        
        return cell
    }
    
    
}
