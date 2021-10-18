//
//  UserViewController.swift
//  Trivia App
//
//  Created by MegaMind on 17/10/21.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var textFieldUserName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let user = self.textFieldUserName.text, !user.isEmpty else { return }
        let data = Questionnaire(user, data: self.readQuestionData())
        self.performSegue(withIdentifier: "segueToQ1", sender: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.textFieldUserName.text = Strings.empty
        switch segue.destination {
        case is Question1ViewController:
            let questionController = segue.destination as? Question1ViewController
            guard let info = sender as? Questionnaire else { return }
            questionController?.questionnaire = info
        default:
            break
        }
    }
    
}

extension UserViewController {
    
    // get question data from plist
    func readQuestionData() -> [String : Any] {
        guard let path = Bundle.main.path(forResource: "Questions", ofType: "plist") else { return [:] }
        guard let dictionary = NSDictionary(contentsOfFile: path) else { return [:] }
        return dictionary as! [String : Any]
    }
    
}

extension UserViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
