//
//  HistoryViewController.swift
//  Trivia App
//
//  Created by MegaMind on 18/10/21.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var userList = [User]()

    @IBOutlet weak var tableViewHistory: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.readUserData()
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension HistoryViewController {
    
    func readUserData() {
        self.userList = DataBaseUser().readAllUserEntries()
        self.tableViewHistory.reloadData()
    }
}
