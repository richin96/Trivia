//
//  DataBaseUser.swift
//  Trivia App
//
//  Created by MegaMind on 18/10/21.
//

import Foundation
import CoreData

class DataBaseUser {
    
    func insertNewUser(with questionnaireData: Questionnaire) {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: CoreData.shared.persistentContainer.viewContext) as! User
        user.createdDate = Date()
        user.userName = questionnaireData.user
        DataBaseQAnswer().insertNewAnswer(with: questionnaireData.userAnswers, user: user)
        CoreData.shared.saveContext()
    }
    
    func readAllUserEntries() -> [User] {
        let managedContext = CoreData.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            let result = try managedContext.fetch(fetchRequest)
            return (result as? [User]) ?? []
        } catch {
            fatalError("DB error occured")
        }
    }
    
    func isEntriesAvaliable() -> Bool {
        return !self.readAllUserEntries().isEmpty
    }
    
}

extension User {
    
    func readUserName() -> String {
        return self.userName ?? Strings.empty
    }
    
    func readUserAnswers() -> [QAnswer] {
        if let bData = self.qAnswer, let answers = Array(bData) as? [QAnswer] {
            return answers
        }
        return []
    }
    
    func readCreatedDate() -> String {
        guard let bDate = self.createdDate else { return Strings.empty }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM, hh:mm a"
        return dateFormatter.string(from: bDate)
    }
    
    func readAnswerFor(id: String) -> String {
        return self.readUserAnswers().first(where: { $0.questionId == id })?.answer ?? Strings.empty
    }
}
