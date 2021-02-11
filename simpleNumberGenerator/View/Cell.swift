//
//  Cell.swift
//  simpleNumberGenerator
//
//  Created by Admin on 05.02.2021.
//  Copyright © 2021 DmitryChaschin. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
     func configurateCell(cell: Cell, indexPath: IndexPath) {
        let oddRow = indexPath.row % 2 == 1 ? true : false
        cell.rightView.backgroundColor = oddRow ? .lightGray : .clear
        cell.leftView.backgroundColor = oddRow ? .clear : .lightGray
        
    }
    
 
    
    
    
    
}
