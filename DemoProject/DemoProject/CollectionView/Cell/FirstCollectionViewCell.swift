//
//  FirstCollectionViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 13/04/23.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    func configureCell(data: String) {
        lblName.text = data
    }
}
