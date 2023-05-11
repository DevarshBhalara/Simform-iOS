//
//  CombineScreenTableViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 04/05/23.
//

import UIKit

class CombineScreenTableViewCell: UITableViewCell {
    
    //MARK: - Outlet
    @IBOutlet weak var btnVCName: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func confiureCell(data: String) {
        btnVCName.setTitle(data, for: .normal)
    }
}
