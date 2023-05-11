//
//  ImageCollectionViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 18/04/23.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    func configureCell(data: UIImage) {
        image.image = data
    }
}
