//
//  QuizDatabaseHelper.swift
//  quick-questions
//
//  Created by Francesco Prospato on 11/4/20.
//

import Foundation

class QuizDatabaseHelper {
    
    // MARK: - Data Enums
    
    enum Category: Int {
        case generalKnowledge = 9
        case entertainmentFilm = 11
        case entertainmentTelevision = 14
        case scienceAndNature = 17
        case science_computers = 18
    }
    
    enum Difficulty: String {
        case unknown
        case easy
        case medium
        case hard
        
        static func fromString(_ string: String) -> Difficulty {
            if string == Difficulty.easy.rawValue {
                return .easy
            } else if string == Difficulty.medium.rawValue {
                return .medium
            } else if string == Difficulty.hard.rawValue {
                return .hard
            } else {
                return .unknown
            }
        }
    }
    
    // MARK: - Variables
    
    static func getQuiz(numberOfQuestions: Int,
                        category: Category,
                        difficulty: Difficulty,
                        completionHandler: @escaping (_ quiz: Quiz?) -> Void) {
        
        var endPointString = "https://opentdb.com/api.php?"
        endPointString += "amount=\(numberOfQuestions)"
        endPointString += "&category=\(category.rawValue)"
        endPointString += "&type=multiple"
        
        guard let url = URL(string: endPointString) else { return completionHandler(nil) }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else {
                return completionHandler(nil)
            }
            
            let quiz = Quiz(from: data)
            return completionHandler(quiz.questions.count > 0 ? quiz : nil)
        }
        
        task.resume()
    }
}
