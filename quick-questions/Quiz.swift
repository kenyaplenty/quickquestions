//
//  Quiz.swift
//  quick-questions
//
//  Created by Francesco Prospato on 11/4/20.
//

import Foundation

class Quiz: NSObject {
    
    var questions = [Question]()
    var questionIndex = 0
    var currentQuestion: Question?
    
    init(from data: Data) {
        
        do {
            guard let jsonResults = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary,
                  let results = jsonResults["results"] as? [AnyObject] else {
                
                return
            }
            
            for result in results {
                if let jsonDict = result as? NSDictionary {
                    questions.append(Question(jsonDict: jsonDict))
                }
            }
            
            print("result")
            
        } catch {
            print("Hey Listen! Could not decode result: \(error.localizedDescription)")
        }
    }
    
    func getNextQuestion() -> Question? {
        let question = questionIndex < questions.count ? questions[questionIndex] : nil
        
        questionIndex += 1
        currentQuestion = question
        
        return question
    }
    
}

class Question: NSObject {
    
    var question: String = ""
    var difficulty: QuizDatabaseHelper.Difficulty = .unknown
    
    var allAnswers = [String]()
    var incorrectAnswers = [String]()
    var correctAnswer: String = ""
    
    init(jsonDict: NSDictionary) {
        if let difficultyString = jsonDict["difficulty"] as? String {
            self.difficulty = QuizDatabaseHelper.Difficulty.fromString(difficultyString)
        }
        
        if let question = jsonDict["question"] as? String {
            var questionString = question.replacingOccurrences(of: "&quot;", with: "\"")
            questionString = questionString.replacingOccurrences(of: "&#039;", with: "\'")
            self.question = questionString
        }
        
        if let correctAnswer = jsonDict["correct_answer"] as? String {
            self.correctAnswer = correctAnswer
        }
        
        if let incorrectAnswers = jsonDict["incorrect_answers"] as? [String] {
            self.incorrectAnswers = incorrectAnswers
        }
        
        allAnswers.append(correctAnswer)
        allAnswers += incorrectAnswers
    }
    
}
