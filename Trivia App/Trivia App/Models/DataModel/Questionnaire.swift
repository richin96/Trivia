//
//  Questionnaire.swift
//  Trivia App
//
//  Created by MegaMind on 17/10/21.
//

import Foundation

class Questionnaire {
    
    let user: String
    var questions = [String : Any]()
    var userAnswers = [String : String]()
    
    init(_ user: String, data: [String:Any]) {
        self.user = user
        self.questions = data
    }
    
    func saveAnswer(_ answer: String, for question: String) {
        self.userAnswers[question] = answer
    }
}
