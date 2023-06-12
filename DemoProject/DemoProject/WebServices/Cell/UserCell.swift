//
//  UserCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/06/23.
//

import UIKit

class UserCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var imgAvatar: UIImageView!
    @IBOutlet private weak var lblEmail: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(user: User) {
        
        if let url = URL(string: user.avatar) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let imageData = data else { return }
                DispatchQueue.main.async {
                    self.imgAvatar.image = UIImage(data: imageData)
                }
            }.resume()
            lblName.text = user.first_name + " " + user.last_name
            lblEmail.text = user.email
        }
        
    }
}
