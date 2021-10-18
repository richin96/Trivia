//
//  OptionCell.swift
//  Trivia App
//
//  Created by MegaMind on 17/10/21.
//

import UIKit

class OptionCell: UITableViewCell {

    @IBOutlet weak var buttonOption: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(item: String, isSelected: Bool, index: IndexPath) {
        self.buttonOption.setTitle(item, for: .normal)
        self.buttonOption.isSelected = isSelected
    }

}
