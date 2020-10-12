//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // MARK: - Property
    
    var quizBrain = QuizBrain()
    var timer = Timer()
    
    // MARK: - Loading view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Function
    
    /// Update UI
    private func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "score: \(quizBrain.updateScore())"
        falseButton.backgroundColor = UIColor.clear
        trueButton.backgroundColor = UIColor.clear
   
    }
    
    // MARK: - IB Action
    
    @IBAction func answerPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else {return}
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { (Timer) in
            self.updateUI()
        })
        
    }
}

