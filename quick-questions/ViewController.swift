//
//  ViewController.swift
//  quick-questions
//
//  Created by karime on 10/7/20.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var option1Btn: UIButton!
    @IBOutlet weak var option2Btn: UIButton!
    @IBOutlet weak var option3Btn: UIButton!
    @IBOutlet weak var option4Btn: UIButton!
    @IBOutlet weak var answerBtn: UIButton!

    // MARK: - Variables

    var selectedOption = 0
    var isProcessingAnswer = false
    var isCorrectAnswer = false
    
    var quiz: Quiz?

    // MARK: - View functions
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupView()
    }
    
    private func _setupView() {
        questionLbl.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        questionLbl.textAlignment = .center
        questionLbl.numberOfLines = 0
        
        answerBtn.setTitle("Answer", for: .normal)
        
        guard let quiz = quiz, let question = quiz.getNextQuestion() else { return }
        _setViewWithQuestion(with: question)
    }
    
    private func _setViewWithQuestion(with question: Question) {
        DispatchQueue.main.async {
            if question.correctAnswer == "" || question.incorrectAnswers.count == 0 {
                //Show error
            }
            
            self.questionLbl.text = question.question
            
            self.option1Btn.setTitle(question.correctAnswer, for: .normal)
            
            var counter = 2
            for incorrectAnswer in question.incorrectAnswers {
                if counter == 2 {
                    self.option2Btn.setTitle(incorrectAnswer, for: .normal)
                } else if counter == 3 {
                    self.option3Btn.setTitle(incorrectAnswer, for: .normal)
                } else {
                    self.option4Btn.setTitle(incorrectAnswer, for: .normal)
                }
                counter += 1
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
    
    @IBAction func option4Tap(_ sender: Any) {
        selectOption4()
    }
    
    func selectOption4() {
        if !isProcessingAnswer {
            selectedOption = selectedOption == 4 ? 0 : 4
        }
    }
    
    // MARK: - Answer actions

    @IBAction func answerBtnTap(_ sender: Any) {
        answerTap()
    }

    func answerTap() {
        isProcessingAnswer = true
        
        guard let quiz = self.quiz, let question = quiz.currentQuestion else { return }
        
        self.isCorrectAnswer = question.correctAnswer == question.allAnswers[selectedOption - 1]
        quiz.correctAnswersCount += isCorrectAnswer ? 1 : 0
        
        let alert = UIAlertController(title: isCorrectAnswer ? "Correct!" : "Wrong :(",
                                      message: nil,
                                      preferredStyle: .alert)
        let nextAction = UIAlertAction(title: quiz.questionIndex == quiz.questions.count
                                        ? "Results" : "Next",
                                      style: .default,
                                      handler: { _ in
                                        
                                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                        if quiz.questionIndex == quiz.questions.count,
                                           let vc = storyboard.instantiateViewController(identifier: "ResultsVC") as? ResultsVC {
                                            
                                            vc.quiz = quiz
                                            vc.modalPresentationStyle = .fullScreen
                                            vc.modalTransitionStyle = .coverVertical
                                            self.present(vc, animated: true, completion: nil)
                                            
                                        } else if let vc = storyboard.instantiateViewController(identifier: "ViewController") as? ViewController {
                                            
                                            vc.quiz = quiz
                                            vc.modalPresentationStyle = .fullScreen
                                            vc.modalTransitionStyle = .flipHorizontal
                                            self.present(vc, animated: true, completion: nil)
                                            
                                        }
        })
        
        alert.addAction(nextAction)
        self.present(alert, animated: true, completion: nil)
        
        isProcessingAnswer = false
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
