//
//  WebServiceCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 19/06/23.
//

import UIKit

class WebServiceCell: UITableViewCell {
    
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
