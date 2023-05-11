//
//  PatientTableViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 05/05/23.
//

import UIKit

class PatientTableViewCell: UITableViewCell {

    @IBOutlet weak var lblPatientName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureCell(data: String) {
        lblPatientName.text = data
    }

}
