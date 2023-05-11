//
//  HeaderTableViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 27/04/23.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var chatIconButton: UIButton!
    @IBOutlet private weak var viewHorizontalLine: UIView!
    @IBOutlet private weak var labelViewScore: UILabel!
    @IBOutlet private weak var imageEye: UIImageView!
    @IBOutlet private weak var labelGroupName: UILabel!
    
    var chatButtonClickedClosure: ((Bool) -> ())?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func chatButtonClicked(_ sender: UIButton) {
        chatButtonClickedClosure?(sender.isSelected)
        
    }
    
    func configureCell(data: GroupStructureModel, sectionNumber: Int) {
        labelGroupName.text = data.sectionName
        chatIconButton.isSelected = data.isSectionIconClick ?? false
        imageEye.isHidden = sectionNumber != 0
        labelViewScore.isHidden = sectionNumber != 0
        viewHorizontalLine.isHidden = sectionNumber != 0
        labelGroupName.preferredMaxLayoutWidth = sectionNumber == 0 ? 140 : self.frame.size.width - chatIconButton.frame.size.width
        print(labelGroupName.preferredMaxLayoutWidth)
    }
    
}
