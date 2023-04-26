//
//  SongModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 26/04/23.
//

import Foundation
struct SongModel {
    var image: String
    var albumName: String
}

struct SongStructureModel {
    var singerName: String
    var songData: [SongModel]
    
    static func getAllSong() -> [SongStructureModel] {
        
        return [
        SongStructureModel(singerName: "The Weekend", songData: [
                                                                SongModel(image: "afterhour", albumName: "After Hours"),
                                                                SongModel(image: "starboy", albumName: "Starboy"),
                                                                SongModel(image: "dawn", albumName: "Dawn"),
                                                                SongModel(image: "trilogy", albumName: "Triolgy")]) ,
        SongStructureModel(singerName: "Juice WRLD", songData: [
                                                            SongModel(image: "farzi", albumName: "Legends never die"),
                                                            SongModel(image: "farzi", albumName: "The light")])
        
        
        ]
        
    }
}
