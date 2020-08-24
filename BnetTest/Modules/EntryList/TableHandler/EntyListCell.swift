//
//  EntyListCell.swift
//  BnetTest
//
//  Created by Антон on 21.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class EntyListCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var modifyDateLabel: UILabel!
    @IBOutlet weak var entryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        modifyDateLabel.isHidden = true
    }
    
    func setData(_ data: EntryData) {
        
        if let dateInt = Int(data.da) {
            dateLabel.text = dateInt.makeDate()
        }
        
        if data.da != data.dm {
            if let dateModifyInt = Int(data.dm) {
                modifyDateLabel.text = "Редактированно: \(dateModifyInt.makeDate())"
                modifyDateLabel.isHidden = false
            }
        }
        
        if data.body.count <= 200 {
            entryLabel.text = data.body
        } else {
            var text = data.body
            for _ in 201...data.body.count {
                text.removeLast()
            }
            text += " ..."
            entryLabel.text = text
        }
    }
}
