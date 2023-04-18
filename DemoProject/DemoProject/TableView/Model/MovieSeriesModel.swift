//
//  MovieModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/04/23.
//

import Foundation

struct MovieSeriesModel {
    var movieImageName: String?
    var movieName: String?
    var rating: Float?
    var isSelected: Bool = false
    var seriesName: String?
    var seriesRating: String?
    var seriesImage: String?
    var seasonCount: Int?

    
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
    
    static func getAllSeries() -> [MovieSeriesModel] {
        return [
            MovieSeriesModel(seriesName: "Elite" , seriesRating: "7.3", seriesImage: "elite", seasonCount: 6),
            MovieSeriesModel(seriesName: "Farzi" , seriesRating:  "8.4", seriesImage: "farzi", seasonCount: 1),
            MovieSeriesModel(seriesName: "13 reasons Why", seriesRating:  "7.5", seriesImage: "13reason", seasonCount: 4),
            MovieSeriesModel(seriesName: "The Boys", seriesRating: "8.7" , seriesImage: "theboys" , seasonCount: 3),
            MovieSeriesModel(seriesName: "The Lord of the Rings", seriesRating: "6.9" , seriesImage: "theLord" , seasonCount: 1)
        ]
    }
}
