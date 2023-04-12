//
//  SeriesModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/04/23.
//

import Foundation

class SereisModel: NSObject {
    var seriesName: String?
    var seriesRating: String?
    var seriesImage: String?
    var seasonCount: Int?
    var isSelected: Bool = false
    
    override init() {
        super.init()
    }
    
    init(_ img: String, _ name: String, _ rating: String, _ seasons: Int) {
        seriesName = name
        seriesImage = img
        seriesRating = rating
        seasonCount = seasons
    }
    
    static func getAllSeries() -> [SereisModel] {
        return [
            SereisModel("elite", "Elite", "7.3", 6),
            SereisModel("farzi", "Farzi", "8.4", 1),
            SereisModel("13reason", "13 reasons Why", "7.5", 4),
            SereisModel("theboys", "The Boys", "8.7", 3),
            SereisModel("theLord", "The Lord of the Rings", "6.9", 1)
        ]
    }
}
