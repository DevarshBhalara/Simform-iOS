//
//  GroupTableViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 27/04/23.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var buttonChatIcon: UIButton!
    @IBOutlet weak var labelAntePanelaties: UILabel!
    @IBOutlet weak var labelCardsEarned: UILabel!
    @IBOutlet weak var labelPlayerName: UILabel!
    
    var changeButton: (() -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(data: GroupModel, row: Int) {
        
        if row == 1 {
            labelPlayerName.textColor = .systemGray2
            labelCardsEarned.textColor = .systemGray2
            labelAntePanelaties.textColor = .systemGray2
            
        } 
        self.backgroundColor = UIColor(white: 1, alpha: 0.2)
        labelPlayerName.text = data.playerName
        labelCardsEarned.text = data.cardsEarned
        labelAntePanelaties.text = data.antePenalities
        buttonChatIcon.isHidden = !data.isChatVisible
        buttonChatIcon.isSelected = data.isChatClicked ?? false
    }
    
    @IBAction func chatIconClicked(_ sender: UIButton) {
        changeButton?()
    }
}
