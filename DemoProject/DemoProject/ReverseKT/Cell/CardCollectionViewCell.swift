//
//  CardCollectionViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 27/04/23.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var plusCountLabel: UILabel!
    @IBOutlet weak var stackViewCardLabel: UIStackView!
    
    func configureCell(currentRow: Int, count: Int) {
        
        if currentRow < 5 {
            plusCountLabel.isHidden = true
        } else {
            plusCountLabel.text = "+\(count)"
            cardImage.isHidden = true
        }
        
    }
    
}
