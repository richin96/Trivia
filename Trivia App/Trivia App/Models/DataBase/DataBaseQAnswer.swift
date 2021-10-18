//
//  DataBaseQAnswer.swift
//  Trivia App
//
//  Created by MegaMind on 18/10/21.
//

import Foundation
import CoreData

class DataBaseQAnswer {
    
    func insertNewAnswer(with data: [String : String], user: User) {
        for ans in data {
            let qAnswer = NSEntityDescription.insertNewObject(forEntityName: "QAnswer", into: CoreData.shared.persistentContainer.viewContext) as! QAnswer
            
            qAnswer.questionId = ans.key
            qAnswer.answer = ans.value
            user.addToQAnswer(qAnswer)
        }
    }
    
}
