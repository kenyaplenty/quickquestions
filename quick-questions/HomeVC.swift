//
//  HomeVC.swift
//  quick-questions
//
//  Created by Francesco Prospato on 11/4/20.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var continueBtn: UIButton!
    
    private var _quiz: Quiz?
    
    // MARK: - View functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _setupView()
    }

    private func _setupView() {
        titleLbl.text = "Quick Questions"
        titleLbl.font = UIFont.systemFont(ofSize: 30, weight: .black)
        titleLbl.textAlignment = .center
        titleLbl.numberOfLines = 0
        
        continueBtn.setTitle("Start Quiz!", for: .normal)
        continueBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    @IBAction func continueBtnTap(_ sender: Any) {
        
        QuizDatabaseHelper.getQuiz(numberOfQuestions: 3, category: .entertainmentFilm, difficulty: .easy) { (quizResult) in
            self._quiz = quizResult
            self._startQuiz()
        }
    }
    
    private func _startQuiz() {
        DispatchQueue.main.async {
            if let quiz = self._quiz,
               let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as? ViewController {
                vc.quiz = quiz
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .flipHorizontal
                self.present(vc, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Error starting quiz.",
                                              message: "Please make sure you're connected to the internet and try again.",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
