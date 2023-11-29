//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    let quiz = [
        Question(q: "1 + 1 = 2", a: "True"),
        Question(q: "1 + 2 = 3", a: "True"),
        Question(q: "1 + 4 = 4", a: "False"),
        Question(q: "1 + 4 = 5", a: "True"),
        Question(q: "1 + 4 = 6", a: "False"),
        Question(q: "1 + 6 = 7", a: "True"),
        Question(q: "1 + 6 = 8", a: "False"),
        Question(q: "1 + 8 = 10", a: "False"),
        Question(q: "1 + 9 = 10", a: "True"),
        Question(q: "2 + 1 = 3", a: "True"),
        Question(q: "2 + 2 = 4", a: "True"),
        Question(q: "2 + 3 = 6", a: "False"),
        Question(q: "2 + 4 = 6", a: "True"),
        Question(q: "2 + 5 = 9", a: "False"),
        Question(q: "2 + 6 = 8", a: "True"),
        Question(q: "2 + 7 = 9", a: "True"),
        Question(q: "2 + 8 = 10", a: "True"),
        Question(q: "2 + 9 = 12", a: "False"),

    ]
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz [questionNumber].answer
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo:nil, repeats: false)
        
    }
    @objc func updateUI() {
        questionLabel.text = quiz[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
    }
    
}

