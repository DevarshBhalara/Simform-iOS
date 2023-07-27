//
//  UserListCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 27/07/23.
//

import UIKit

class UserListCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(data: UserCoreData) {
        lblEmail.text = data.email
        lblUserName.text = data.username
        lblNumber.text = data.mobilenumber
    }
}
