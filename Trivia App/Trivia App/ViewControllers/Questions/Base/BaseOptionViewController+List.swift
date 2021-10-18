//
//  BaseOptionViewController+List.swift
//  Trivia App
//
//  Created by MegaMind on 17/10/21.
//

import UIKit

extension BaseOptionViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.readSelectionType() == .single ? self.listOptions.count : self.listOptions.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = self.readSelectionType() == .multiple ? indexPath.row-1: indexPath.row
        if self.readSelectionType() == .multiple, indexPath.row == 0  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "selectAllCell") as! SelectALLCell
            cell.configure(isSelected: self.selectedOptions.count == self.listOptions.count, index: indexPath)
            return cell
        }
        let option = self.readOptions()[index]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! OptionCell
        cell.configure(item: option, isSelected: self.selectedOptions.contains(option), index: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.readSelectionType() == .multiple {
            if indexPath.row == 0 {
                self.selectedOptions.removeAll()
                self.selectedOptions.append(contentsOf: self.listOptions)
            } else {
                let option = self.readOptions()[indexPath.row-1]
                if self.selectedOptions.contains(option), let index = self.selectedOptions.firstIndex(of: option) {
                    self.selectedOptions.remove(at: index)
                } else {
                    self.selectedOptions.append(option)
                }
            }
        } else {
            self.selectedOptions = [self.readOptions()[indexPath.row]]
        }
        self.tableViewOptions.reloadData()
    }
    
}
