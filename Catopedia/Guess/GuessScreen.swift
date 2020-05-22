//
//  GuessScreen.swift
//  Catopedia
//
//  Created by Ilya Kangin on 5/11/20.
//  Copyright © 2020 Ilya Kangin. All rights reserved.
//

import UIKit

class GuessScreen: UIViewController {
    
// MARK: - Variables
    
    var listOfCats = [CatInfo]()
    var data = [CatInfo]()
    
    var buffer = [String]()
    
    var answer = 5
    var iterator = 0
    var points = 0
    var clicked = true
    var pos = 0
    
// MARK: - Outlets and actions
    
    @IBOutlet weak var exitButton: UIButton!
    @IBAction func exitButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBOutlet weak var answerButton: UIButton!
    @IBAction func answerButtonAction(_ sender: Any) {
        
        if answer >= 0 && answer <= 3{
        
            if clicked {
                clicked = false
                answerButton.setTitle("Next", for: .normal)
                buttonEnabling()
                
                if answer == pos {
                    points = points + 1
                }
                
                for i in 0...3 {
                    if i == pos {
                        buttonImages[i].image = #imageLiteral(resourceName: "greenRadioButton.png")
                    } else {
                        buttonImages[i].image = #imageLiteral(resourceName: "redRadioButton.png")
                    }
                }
                
            } else if !clicked {
                
                if iterator == 4 {
                    showResultScreen()
                } else {
                    clicked = true
                    iterator = iterator + 1
                    answer = 5
                    answerButton.setTitle("Answer", for: .normal)
                    updateArray()
                    buttonEnabling()
                }
            }
        }
    }
    
    @IBOutlet weak var catQuizImage: UIImageView!
    @IBOutlet var answerButtons: [UIButton]!
    @IBAction func answerButtonsAction(_ sender: UIButton) {
        let tag = sender.tag
        for button in answerButtons {
            if button.tag == tag {
                buttonImages[tag].image = #imageLiteral(resourceName: "selectedButton")
                answer = tag
            } else {
                buttonImages[button.tag].image = #imageLiteral(resourceName: "buttonFrame")
            }
        }
    }
    @IBOutlet var buttonImages: [UIImageView]!


// MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        exitButton.layer.cornerRadius = 10.0
        answerButton.layer.cornerRadius = 10.0
        
        createArray()
    }
    
// MARK: - Functions
    
    func createArray() {
        for _ in 0...3 {
            data.append( listOfCats[Int.random(in: 0 ... listOfCats.count-1)] )
        }

        reloadData()
    
        buffer.append(data[pos].breeds[0].name)
        print(buffer)
    }
    
    func updateArray() {
        for i in 0...3 {
            data[i] = listOfCats[Int.random(in: 0 ... listOfCats.count-1)]
        }

        reloadData()
    
        externalCheck()
        buffer.append(data[pos].breeds[0].name)
        print(buffer)
        catQuizImage.load(url: URL(string: data[pos].url)!)
    }
    
    func reloadData() {
        
        internalCheck()
        
        for i in 0...3 {
            buttonImages[i].image = #imageLiteral(resourceName: "buttonFrame")
            answerButtons[i].setTitle(data[i].breeds[0].name, for: .normal)
        }
        
        pos = Int.random(in: 0...3)
        catQuizImage.load(url: URL(string: data[pos].url)!)
    }
    
    func buttonEnabling() {
        for i in 0...3 {
            answerButtons[i].isEnabled = !answerButtons[i].isEnabled
        }
    }
    
    func showResultScreen(){
        let vc = storyboard?.instantiateViewController(identifier: "quizResultScreen") as! QuizResultScreen

        vc.finalPoints = points
        
        self.present(vc, animated: true)
    }
    
    func internalCheck(){
        for i in 0...2 {
            for j in i+1...3 {
                if data[i].breeds[0].name == data[j].breeds[0].name {
                    data[i] = listOfCats[Int.random(in: 0 ... listOfCats.count-1)]
                    internalCheck()
                }
            }
        }
    }
    
    func externalCheck(){
        for j in 0...buffer.count - 1 {
            if data[pos].breeds[0].name == buffer[j] {
                data[pos] = listOfCats[Int.random(in: 0 ... listOfCats.count-1)]
                externalCheck()
            }
        }
    }
}
