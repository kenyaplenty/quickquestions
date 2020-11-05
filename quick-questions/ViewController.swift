//
//  ViewController.swift
//  quick-questions
//
//  Created by karime on 10/7/20.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var option1Btn: UIButton!
    @IBOutlet weak var option2Btn: UIButton!
    @IBOutlet weak var option3Btn: UIButton!
    @IBOutlet weak var answerBtn: UIButton!

    // MARK: - Variables

    var selectedOption = 0
    var isProcessingAnswer = false
    var isCorrectAnswer = false
    
    var quiz: Quiz?

    // MARK: - View functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        QuizDatabaseHelper.getQuiz(numberOfQuestions: 3, category: .entertainmentFilm, difficulty: .easy) { (result) in
            
            if let quizResult = result {
                self.quiz = quizResult
            }
        }
    }

    // MARK: - Selection actions

    @IBAction func option1Tap(_ sender: Any) {
        selectOption1()
    }

    func selectOption1() {
        if !isProcessingAnswer {
            selectedOption = selectedOption == 1 ? 0 : 1
        }
    }

    @IBAction func option2Tap(_ sender: Any) {
        selectOption2()
    }

    func selectOption2() {
        if !isProcessingAnswer {
            selectedOption = selectedOption == 2 ? 0 : 2
        }
    }

    @IBAction func option3Tap(_ sender: Any) {
        selectOption3()
    }

    func selectOption3() {
        if !isProcessingAnswer {
            selectedOption = selectedOption == 3 ? 0 : 3
        }
    }

    // MARK: - Answer actions

    @IBAction func answerBtnTap(_ sender: Any) {
        answerTap()
    }

    func answerTap() {
        isProcessingAnswer = true
    }

    func answerIsCorrect() {
        isProcessingAnswer = false
        isCorrectAnswer = true

        selectedOption = 0
    }

    func answerIsWrong() {
        isProcessingAnswer = false
        isCorrectAnswer = false

        selectedOption = 0
    }
}
