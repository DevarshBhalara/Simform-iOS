//
//  TestTableViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 01/05/23.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
