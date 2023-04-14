//
//  SeriesModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 14/04/23.
//

import Foundation
struct SeriesCollectionModel {
    
    var seriesImage: String?
    var seriesName: String?
    var seriesRating: String?
    var seasonCount: Int?
    var isSelected: Bool = false

    
    static func getAllSeries() -> [SeriesCollectionModel] {
        return [
            SeriesCollectionModel(seriesImage: "elite", seriesName: "Elite", seriesRating: "7.3", seasonCount: 6),
            SeriesCollectionModel(seriesImage: "farzi", seriesName: "Farzi", seriesRating: "8.4", seasonCount: 1),
            SeriesCollectionModel(seriesImage: "13reason", seriesName: "13 reasons Why", seriesRating: "7.5", seasonCount: 4),
            SeriesCollectionModel(seriesImage: "theboys", seriesName: "The Boys", seriesRating: "8.7", seasonCount: 3),
            SeriesCollectionModel(seriesImage: "theLord", seriesName: "The Lord of the Rings", seriesRating: "6.9", seasonCount: 1)
        ]
    }
}
