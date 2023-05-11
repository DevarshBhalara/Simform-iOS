//
//  SeriesCollectionViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 14/04/23.
//

import UIKit


class SeriesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var seriesRating: UILabel!
    @IBOutlet weak var seriesName: UILabel!
    @IBOutlet weak var seriesImage: UIImageView!
    @IBOutlet weak var seriesSeasonCount: UILabel!
    func configureCell(data: SeriesCollectionModel) {
        seriesName.text = data.seriesName
        seriesImage.image = UIImage(named: data.seriesImage ?? "avatar")
        seriesRating.text = "Rating \(data.seriesRating ?? "NA")"
        seriesSeasonCount.text = "Seasons : \(data.seasonCount ?? 1)"
        self.layer.cornerRadius = 10.0
    }
    
}
