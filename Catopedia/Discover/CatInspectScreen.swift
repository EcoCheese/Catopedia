//
//  CatInspectScreen.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/14/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import UIKit

class CatInspectScreen: UIViewController {
    
    
// MARK: - Variables
    
    var catImagePhoto = UIImage()
    var oneCat = [String]()
    var headers = ["Info: ", "Temperament: ", "Origin: ", "Avg weight: ", "Avg life span: "]
    
// MARK: - Outlets and Actions
    
    @IBOutlet weak var informationTableView: UITableView!
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func wikiButton(_ sender: Any) {
        UIApplication.shared.open(URL(string: oneCat[6])!, options: [:], completionHandler: nil)
    }
    @IBOutlet weak var catNameLabel: UILabel!
    @IBOutlet weak var catPhoto: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
// MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = backgroundImage.bounds
        backgroundImage.addSubview(blurView)
        
        catPhoto.image = catImagePhoto
        backgroundImage.image = catImagePhoto
        
        catNameLabel.text = oneCat[5]
        
        informationTableView.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 60, right: 0)
        
        informationTableView.delegate = self
        informationTableView.dataSource = self
    }
}

// MARK: - TableView

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
