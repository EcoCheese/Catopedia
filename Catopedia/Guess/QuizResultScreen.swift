//
//  QuizResultScreen.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/18/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import UIKit

class QuizResultScreen: UIViewController {

    
    @IBOutlet weak var congratulationsLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var exitButton: UIButton!
    @IBAction func exitButtonAction(_ sender: guessScreen) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        exitButton.layer.cornerRadius = 10.0
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
