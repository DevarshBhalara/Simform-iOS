//
//  MovieCollectionViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 26/04/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func configureCell (data: MovieModel) {
        movieRating.text = "\(data.rating ?? 0.0) "
        movieName.text = data.movieName
        imageView.image = UIImage(named: data.movieImageName ?? "")
        self.layer.cornerRadius = 10.0
    }
    
}
