//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    
    var quizBrain = QuizBrain()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func answerPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        if (quizBrain.checkAnswer(userAnswer)){
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        quizBrain.nextQuestion()
    }
    
    @objc func updateUI(){
        let progessPercentage: Float = quizBrain.getProgress()
        print(progessPercentage)
        progressBar.progress = progessPercentage
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}

