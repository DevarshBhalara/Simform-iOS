//
//  CollapseTableViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 14/04/23.
//

import UIKit

class CollapseTableViewCell: UITableViewCell {

    @IBOutlet weak var btnExpand: UIButton!
    @IBOutlet weak var lblText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
