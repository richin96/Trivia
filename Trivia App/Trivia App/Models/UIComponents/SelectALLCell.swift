//
//  SelectALLCell.swift
//  Trivia App
//
//  Created by MegaMind on 17/10/21.
//

import UIKit

class SelectALLCell: UITableViewCell {

    @IBOutlet weak var buttonSelectAll: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(isSelected: Bool, index: IndexPath) {
        self.buttonSelectAll.isSelected = isSelected
    }

}
