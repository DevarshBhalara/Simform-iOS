//
//  AnimalTableViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/04/23.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {

    @IBOutlet weak var lblAnimalName: UILabel!
    @IBOutlet weak var imgAnimal: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configAnimal(data: AnimalModel) {
        lblAnimalName.text = data.animalName
        imgAnimal.image = UIImage(named: data.animalImage ?? "")
    }
    
}
