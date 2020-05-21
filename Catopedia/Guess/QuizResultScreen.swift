//
//  QuizResultScreen.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/18/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import UIKit

class QuizResultScreen: UIViewController {
    
// MARK: - Variables
    var finalPoints = 0
    let congratulations = ["Try again,", "Bad result,", "Not bad,", "Try better,", "Very good,", "Well done,"]
    
    
// MARK: - Outlets and actions
    @IBOutlet weak var congratulationsLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var exitButton: UIButton!
    @IBAction func exitButtonAction(_ sender: GuessScreen) {
        self.view.window!.rootViewController?.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exitButton.layer.cornerRadius = 10.0
        congratulationsLabel.text = congratulations[finalPoints]
        pointsLabel.text = String(finalPoints) + "/5 points"
    }
}
