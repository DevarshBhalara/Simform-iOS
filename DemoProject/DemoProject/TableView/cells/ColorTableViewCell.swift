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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("Awake")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        print("Reuse called \(btnSelect.isSelected)")
        btnSelect.isSelected = false
    }
    
    func configureCell(data: FruitColorData) {
        lblColor.text = data.name
    }
    
    func btnSelected() {
        btnSelect.isSelected = true
    }
    
    
}
