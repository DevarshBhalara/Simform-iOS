//
//  JobSliderCellCollectionViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 17/04/23.
//

import UIKit

class JobSliderCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shellLogoImage: UIImageView!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureItem(data: JobSliderCellCollectionViewCell) {
        data.layer.cornerRadius = 10.0
        data.backgroundColor = .random()
        shellLogoImage.layer.cornerRadius = 8
    }
}
