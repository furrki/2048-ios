//
//  GameCell.swift
//  2048
//
//  Created by Furkan Kaynar on 5.05.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell {
    @IBOutlet weak var numberLabel: UILabel!
    
    func initialize(no: Int) {
        if no != 0 {
            numberLabel.text = "\(no)"
            let colors = getColor(for: no)
            contentView.backgroundColor = colors[0]
            numberLabel.textColor = colors[1]
        } else {
            numberLabel.text = ""
        }
    }
}
