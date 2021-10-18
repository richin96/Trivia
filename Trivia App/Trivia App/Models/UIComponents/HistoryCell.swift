//
//  HistoryCell.swift
//  Trivia App
//
//  Created by MegaMind on 18/10/21.
//

import UIKit

class HistoryCell: UITableViewCell {

    @IBOutlet weak var labelHistoryInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(historyInfo: User, index: IndexPath) {
        self.labelHistoryInfo.text = ContentStrings.history(index.row+1, historyInfo.readCreatedDate(), historyInfo.readUserName(), historyInfo.readAnswerFor(id: "Question1"), historyInfo.readAnswerFor(id: "Question2"))
    }
}
