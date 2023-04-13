//
//  ColorTableViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 13/04/23.
//

import UIKit

class ColorTableViewCell: UITableViewCell {

    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet weak var lblColor: UILabel!
    var isSelect: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
