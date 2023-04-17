//
//  SeriesTableViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/04/23.
//

import UIKit

class SeriesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var btnWatched: UIButton!
    @IBOutlet weak var seriesImage: UIImageView!
    @IBOutlet weak var seriesName: UILabel!
    @IBOutlet weak var seasonCount: UILabel!
    @IBOutlet weak var seriesRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configSereisCell(data: SereisModel) {
        seriesImage.image = UIImage(named: data.seriesImage ?? "")
        seriesName.text = data.seriesName ?? "NA"
        seriesRating.text = "Rating : \(data.seriesRating ?? "NA")"
        seasonCount.text = "Seasons : \(data.seasonCount ?? 0)"
    
        if data.isSelected == true {
            btnWatched.backgroundColor = .gray
            btnWatched.titleLabel?.text = "Yes Watched!"
        } else {
            btnWatched.backgroundColor = .black
            btnWatched.titleLabel?.text = "Watched?"
        }
        
    }
}
