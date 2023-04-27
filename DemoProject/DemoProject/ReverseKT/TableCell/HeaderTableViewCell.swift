//
//  HeaderTableViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 27/04/23.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var chatIconButton: UIButton!
    @IBOutlet weak var viewHorizontalLine: UIView!
    @IBOutlet weak var labelViewScore: UILabel!
    @IBOutlet weak var imageEye: UIImageView!
    @IBOutlet weak var labelGroupName: UILabel!
    
    var chatButtonClickedClosure: ((Bool) -> ())?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func chatButtonClicked(_ sender: UIButton) {
        chatButtonClickedClosure?(sender.isSelected)
 
    }
    
    func configureCell(data: GroupStructureModel, sectionNumber: Int) {
        labelGroupName.text = data.sectionName
        chatIconButton.isSelected = data.isSectionIconClick ?? false
        
        if sectionNumber != 0 {
            imageEye.isHidden = true
            labelViewScore.isHidden = true
            viewHorizontalLine.isHidden = true
        }
    }
    
}
