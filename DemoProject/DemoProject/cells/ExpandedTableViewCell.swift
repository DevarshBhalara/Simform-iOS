//
//  ExpandedTableViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 14/04/23.
//

import UIKit

class ExpandedTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var btnMoreLess: UIButton!
    
    var expand: ((_ expanded: Bool) -> ())?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onClickMoreLess(_ sender: UIButton) {

        sender.isSelected.toggle()
        lblDescription.numberOfLines = sender.isSelected ? 0 : 2
//        if sender.isSelected {
//            lblDescription.numberOfLines = 0
//            btnMoreLess.titleLabel?.text = "Less"
//        } else {
//            lblDescription.numberOfLines = 2
//            btnMoreLess.titleLabel?.text = "More"
//        }
        
        expand?(sender.isSelected)
    }
}
