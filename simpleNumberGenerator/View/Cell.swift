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
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
     func configurateCell(cell: Cell, indexPath: IndexPath) {
        let number = Number(isGray: false)
              if (indexPath.row % 2 == 0) {
                  number.isGray = true
              }
              cell.rightView.backgroundColor = number.isGray ? .clear : .lightGray
              cell.leftView.backgroundColor = number.isGray ? .lightGray : .clear
    }
    
 
    
    
    
    
}
