//
//  BaseOptionViewController.swift
//  Trivia App
//
//  Created by MegaMind on 17/10/21.

// used as base for both questions

import UIKit

class BaseOptionViewController: UIViewController {
    
    var listOptions = [String]()
    var selectedOptions = [String]()
    var questionnaire: Questionnaire! {
        didSet {
            self.listOptions = self.readOptions()
        }
    }
    
    var questionId: String {
        return Strings.empty
    }
    
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var tableViewOptions: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
    }
    
    func readSelectionType() -> SelectionType {
        return .single
    }
    
    private func readShowableQuestion() -> [String:Any] {
        return (self.questionnaire.questions[self.questionId] as? [String:Any]) ?? [:]
    }
    
    func readQuestion() -> String {
        return (self.readShowableQuestion()["Question"] as? String) ?? Strings.empty
    }

    func readOptions() -> [String] {
        return (self.readShowableQuestion()["Options"] as? [String]) ?? []
    }
}


extension BaseOptionViewController {
    
    func initializeUI() {
        self.labelQuestion.text = self.readQuestion()
    }
}
