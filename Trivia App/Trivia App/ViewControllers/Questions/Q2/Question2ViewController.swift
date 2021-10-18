//
//  Question2ViewController.swift
//  Trivia App
//
//  Created by MegaMind on 17/10/21.
//

import UIKit

class Question2ViewController: BaseOptionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var questionId: String {
        return "Question2"
    }
    
    override func readSelectionType() -> SelectionType {
        return .multiple
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard !self.selectedOptions.isEmpty else { return }
        self.questionnaire.saveAnswer(self.selectedOptions.joined(separator: ", "), for: self.questionId)
        self.performSegue(withIdentifier: "segueToSummary", sender: self.questionnaire)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case is SummaryViewController:
            let summaryController = segue.destination as? SummaryViewController
            guard let info = sender as? Questionnaire else { return }
            summaryController?.questionnaire = info
        default:
            break
        }
    }
    
}
