//
//  Question1ViewController.swift
//  Trivia App
//
//  Created by MegaMind on 17/10/21.
//

import UIKit

class Question1ViewController: BaseOptionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var questionId: String {
        return "Question1"
    }
    
    override func readSelectionType() -> SelectionType {
        return .single
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard !self.selectedOptions.isEmpty else { return }
        self.questionnaire.saveAnswer(self.selectedOptions.joined(), for: self.questionId)
        self.performSegue(withIdentifier: "segueToQ2", sender: self.questionnaire)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case is Question2ViewController:
            let questionController = segue.destination as? Question2ViewController
            guard let info = sender as? Questionnaire else { return }
            questionController?.questionnaire = info
        default:
            break
        }
    }
}
