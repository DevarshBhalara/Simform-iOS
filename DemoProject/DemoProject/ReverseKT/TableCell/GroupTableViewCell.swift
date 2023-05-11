//
//  GroupTableViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 27/04/23.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet private weak var buttonChatIcon: UIButton!
    @IBOutlet  weak var labelAntePanelaties: UILabel!
    @IBOutlet  weak var labelCardsEarned: UILabel!
    @IBOutlet  weak var labelPlayerName: UILabel!
    
    var changeButton: ((Bool) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(data: GroupModel?, row: Int) {
        
        labelPlayerName.textColor = row == 1 ? .systemGray2 : .white
        labelCardsEarned.textColor = row == 1 ? .systemGray2 : .white
        labelAntePanelaties.textColor = row == 1 ? .systemGray2 : .white
        
        self.backgroundColor = UIColor(white: 1, alpha: 0.2)
        labelPlayerName.text = row == 1 ? "Player Name" : data?.playerName
        labelCardsEarned.text = row == 1 ? "Cards Earned" : data?.cardsEarned
        labelAntePanelaties.text = row == 1 ? "Ante + Panelaties" : data?.antePenalities
        buttonChatIcon.isHidden = row == 1 ? true : !(data?.isChatVisible ?? false)
        buttonChatIcon.isSelected = row == 1 ? false :   data?.isChatClicked ?? false
    }
    
    @IBAction func chatIconClicked(_ sender: UIButton) {
        changeButton?(sender.isSelected)
    }
}
