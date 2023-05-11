//
//  SecondCollectionViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 13/04/23.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    
    func configureCell(data: String) {
        lblName.text = data
    }
}
