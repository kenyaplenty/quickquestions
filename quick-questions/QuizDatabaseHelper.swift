//
//  QuizDatabaseHelper.swift
//  quick-questions
//
//  Created by Francesco Prospato on 11/4/20.
//

import Foundation

class QuizDatabaseHelper {
    
    // MARK: - Data Enums
    
    enum Category: Int, CaseIterable {
        case generalKnowledge = 9
        case entertainmentFilm = 11
        case entertainmentTelevision = 14
        case scienceAndNature = 17
        case science_computers = 18
        
        func toString() -> String {
            switch self {
            case .generalKnowledge:
                return "General Knowledge"
            case .entertainmentFilm:
                return "Movies"
            case .entertainmentTelevision:
                return "TV"
                
            case .scienceAndNature:
                return "Science & Nature"
                
            case .science_computers:
                return "Tech"
            }
        }
    }
    
    enum Difficulty: String {
        case random = "Random"
        case easy = "Easy"
        case medium = "Medium"
        case hard = "Hard"
        case unknown
        
        static func fromString(_ string: String) -> Difficulty {
            if string == Difficulty.easy.rawValue {
                return .easy
            } else if string == Difficulty.medium.rawValue {
                return .medium
            } else if string == Difficulty.hard.rawValue {
                return .hard
            } else {
                return .random
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
        
        if difficulty != .random {
            endPointString += "&difficulty=\(difficulty.rawValue.lowercased())"
        }
        
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
