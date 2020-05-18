//
//  GuessScreen.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/11/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import UIKit

class guessScreen: UIViewController {
    
    var answer = 0
    var iterator = 0
    var points = 0

    @IBOutlet weak var exitButton: UIButton!
    
    @IBAction func exitButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBOutlet weak var answerButton: UIButton!
    @IBAction func answerButtonAction(_ sender: Any) {
        
        if answer != 0 {
        
            if iterator == 4 {
                
//                dismiss(animated: true, completion: nil)
                
                let vc = storyboard?.instantiateViewController(identifier: "quizResultScreen") as! QuizResultScreen

                self.present(vc, animated: true)
                
            }
            
            iterator = iterator + 1
            print(answer)
            firstButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            secondButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            thirdButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            fourthButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
        }
    }
    
    @IBOutlet weak var catQuizImage: UIImageView!
    
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet weak var fourthAnswerButton: UIButton!
    
    @IBAction func firstAnswerButtonAction(_ sender: UIButton) {
        if sender.isSelected {
            firstButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            secondButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            thirdButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            fourthButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
        } else {
            answer = 1
            firstButtonImage.image = #imageLiteral(resourceName: "selectedButton")
            secondButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            thirdButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            fourthButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
        }
    }
    @IBAction func secondAnswerButtonAction(_ sender: UIButton) {
        if sender.isSelected {
            firstButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            secondButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            thirdButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            fourthButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
        } else {
            answer = 2
            firstButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            secondButtonImage.image = #imageLiteral(resourceName: "selectedButton")
            thirdButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            fourthButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
        }
        
    }
    @IBAction func thirdAnswerButtonAction(_ sender: UIButton) {
        if sender.isSelected {
            firstButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            secondButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            thirdButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            fourthButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
        } else {
            answer = 3
            firstButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            secondButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            thirdButtonImage.image = #imageLiteral(resourceName: "selectedButton")
            fourthButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
        }
        
    }
    @IBAction func fourthAnswerButtonAction(_ sender: UIButton) {
        if sender.isSelected {
            firstButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            secondButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            thirdButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            fourthButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
        } else {
            answer = 4
            firstButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            secondButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            thirdButtonImage.image = #imageLiteral(resourceName: "buttonFrame")
            fourthButtonImage.image = #imageLiteral(resourceName: "selectedButton")
        }
        
    }
    
    @IBOutlet weak var firstButtonImage: UIImageView!
    @IBOutlet weak var secondButtonImage: UIImageView!
    @IBOutlet weak var thirdButtonImage: UIImageView!
    @IBOutlet weak var fourthButtonImage: UIImageView!
    

    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exitButton.layer.cornerRadius = 10.0
        answerButton.layer.cornerRadius = 10.0
    
    
        
    }

    
}
