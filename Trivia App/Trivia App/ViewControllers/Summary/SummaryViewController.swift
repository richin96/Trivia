//
//  SummaryViewController.swift
//  Trivia App
//
//  Created by MegaMind on 17/10/21.
//

import UIKit

class SummaryViewController: UIViewController {

    var questionnaire: Questionnaire!
    
    @IBOutlet weak var labelUserGreet: UILabel!
    @IBOutlet weak var buttonHistory: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
    }
    
    @IBAction func finishButtonTapped(_ sender: UIButton) {
        DataBaseUser().insertNewUser(with: self.questionnaire)
        for controller in (self.navigationController?.viewControllers ?? []) {
            if controller is UserViewController {
                self.navigationController?.popToViewController(controller, animated: true)
            }
        }
    }
    
    @IBAction func historyButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueToHistory", sender: self)
    }
}

extension SummaryViewController {
    
    func initializeUI() {
        self.labelUserGreet.text = ContentStrings.summary(self.questionnaire.user, (self.questionnaire.userAnswers["Question1"] ?? Strings.empty) , (self.questionnaire.userAnswers["Question2"] ?? Strings.empty))
        self.buttonHistory.isHidden = !DataBaseUser().isEntriesAvaliable()
        
    }
}
