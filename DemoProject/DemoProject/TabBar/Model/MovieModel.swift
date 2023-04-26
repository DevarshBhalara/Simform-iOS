//
//  MovieModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 26/04/23.
//

import Foundation
struct MovieModel {
    var movieImageName: String?
    var movieName: String?
    var rating: Float?

    static func getAllMovies() -> [MovieSeriesModel] {
        return [
            MovieSeriesModel(movieImageName: "avtar", movieName: "Avatar", rating: 9.1),
            MovieSeriesModel(movieImageName: "titanic", movieName: "Titanic", rating: 9.3),
            MovieSeriesModel(movieImageName: "airlift", movieName: "Airlift", rating: 8.7),
            MovieSeriesModel(movieImageName: "extraction", movieName: "Extraction", rating: 8.4),
            MovieSeriesModel(movieImageName: "venom", movieName: "Venom", rating: 8.0),
            MovieSeriesModel(movieImageName: "glassonion", movieName: "Glass Onion", rating: 7.8),
            MovieSeriesModel(movieImageName: "fastX", movieName: "Fast X", rating: 9.3)
        ]
    }

}

struct MovieModelStructure {
    
    var sectionName: String
    var movieData: [MovieModel]
    
    static func getAllMovies() -> [MovieModelStructure] {
        return [
            MovieModelStructure(sectionName: "Hindi", movieData: [
                                                                  MovieModel(movieImageName: "airlift", movieName: "Airlift", rating: 8.7),
                                                                  ]),
            MovieModelStructure(sectionName: "English", movieData: [
                                                                MovieModel(movieImageName: "avtar", movieName: "Avatar", rating: 9.1),
                                                                MovieModel(movieImageName: "titanic", movieName: "Titanic", rating: 9.3),
                                                                MovieModel(movieImageName: "extraction", movieName: "Extraction", rating: 8.4),
                                                                MovieModel(movieImageName: "venom", movieName: "Venom", rating: 8.0),
                                                                MovieModel(movieImageName: "glassonion", movieName: "Glass Onion", rating: 7.8),
                                                                MovieModel(movieImageName: "fastX", movieName: "Fast X", rating: 9.3)] )
        ]
    }
    
}
