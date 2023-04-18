//
//  MovieTableViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/04/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var btnWatchNow: UIButton!
    @IBOutlet weak var lblrating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(data: MovieSeriesModel) {
        imgMovie.image = UIImage(named: data.movieImageName ?? "")
        lblMovieName.text = data.movieName ?? "NA"
        lblrating.text = "\(data.rating ?? 0)"
        if data.isSelected {
            btnWatchNow.titleLabel?.text = "Yes Watched!"
            btnWatchNow.titleLabel?.font.withSize(10.0)
            btnWatchNow.backgroundColor = .gray
        } else {
            btnWatchNow.titleLabel?.text = "Watched?"
            btnWatchNow.backgroundColor = .black
        }
    }
    
}
