//
//  FruitColorModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 14/04/23.
//

import Foundation
struct FruitColorModel {
    var sectionName: String
    var dataAgain: [FruitColorData]?
    var data : [String]?
    var indexForSelectedFruit: Int = 2
    
    static func getAllData() -> [FruitColorModel] {
      return [  FruitColorModel(sectionName: "Fruits", data: ["Apple", "Banana" , "Mango"]),
                FruitColorModel(sectionName: "Colors", data: ["patato", "tomato", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki", "Loki"]) ]
    }
    
    static func getAllDataFruitColorModel() -> [FruitColorModel] {
        return [
            FruitColorModel(sectionName: "Fruits", data: ["Apple", "Banana" , "Mango"]),
            FruitColorModel(sectionName: "Color", dataAgain: [FruitColorData(name: "Red", isSelectedColor: false),
                                                              FruitColorData(name: "Blue", isSelectedColor: false),
                                                              FruitColorData(name: "yellow", isSelectedColor: false),
                                                              FruitColorData(name: "purple", isSelectedColor: false),
                                                              FruitColorData(name: "magenta", isSelectedColor: false),
                                                              FruitColorData(name: "orange", isSelectedColor: false),
                                                              FruitColorData(name: "green", isSelectedColor: false),
                                                              FruitColorData(name: "Red1", isSelectedColor: false),
                                                              FruitColorData(name: "Red2", isSelectedColor: false),
                                                              FruitColorData(name: "Red3", isSelectedColor: false),
                                                              FruitColorData(name: "Red2", isSelectedColor: false),
                                                              FruitColorData(name: "Red3", isSelectedColor: false),
                                                              FruitColorData(name: "Red2", isSelectedColor: false),
                                                              FruitColorData(name: "Red3", isSelectedColor: false),
                                                              FruitColorData(name: "Red2", isSelectedColor: false)] ),
            
        
        ]
    }
}
