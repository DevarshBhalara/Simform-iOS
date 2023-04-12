//
//  MovieModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/04/23.
//

import Foundation

class MovieModel: NSObject {
    var movieImageName: String?
    var movieName: String?
    var rating: Float?
    var isSelected: Bool = false
    
    override init() {
        super.init()
    }
    
    init(_ img: String, _ name: String, _ rating: Float) {
        movieImageName = img
        movieName = name
        self.rating = rating
    }
    
    static func getAllMovies() -> [MovieModel] {
        return [
            MovieModel("avtar", "Avatar", 9.1),
            MovieModel("titanic", "Titanic", 9.3),
            MovieModel("airlift", "Airlift", 8.7),
            MovieModel("extraction", "Extraction", 8.4),
            MovieModel("venom", "Venom", 8.0),
            MovieModel("glassonion", "Glass Onion", 7.8),
            MovieModel("fastX", "Fast X", 9.3)
        ]
    }
}
