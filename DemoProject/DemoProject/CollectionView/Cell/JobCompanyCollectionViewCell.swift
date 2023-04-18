//
//  JobCompanyCollectionViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 17/04/23.
//

import UIKit

class JobCompanyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var companyImage: UIImageView!
    
    @IBOutlet weak var jobPosition: UILabel!
    
    @IBOutlet weak var companyName: UILabel!
    
    
    @IBOutlet weak var jobSalary: UILabel!
    
    func configureItem(cell: JobCompanyCollectionViewCell, data: JobModel) {
        companyImage.image = UIImage(named: data.companyImage ?? "spotify")
        companyName.text = data.companyName
        jobPosition.text = data.jobPosition
        jobSalary.text = data.jobSalary
        cell.layer.cornerRadius = 10.0
    }
    
}
