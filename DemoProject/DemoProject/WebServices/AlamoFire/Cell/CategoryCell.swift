//
//  CategoryCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 15/06/23.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var btnCategory: UIButton!
    
    func configure(name: String) {
        btnCategory.setTitle(name, for: .normal)
        
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        layer.cornerRadius = bounds.height / 2
        
        let transparentView = UIView(frame: bounds)
        transparentView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        backgroundView = transparentView
        
        
        let blueView = UIView(frame: bounds)
        blueView.backgroundColor = UIColor(named: "yellowCustom")
        selectedBackgroundView = blueView
    }
}
