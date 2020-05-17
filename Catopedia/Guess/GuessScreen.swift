//
//  GuessScreen.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/11/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import UIKit

class guessScreen: UIViewController {

    @IBOutlet weak var exitButton: UIButton!
    
    @IBAction func exitButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBOutlet weak var answerButton: UIButton!
    
    @IBOutlet weak var catQuizImage: UIImageView!
    


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exitButton.layer.cornerRadius = 10.0
        answerButton.layer.cornerRadius = 10.0
    
    
        
    }

    
}
