//
//  AnimalModelStructure.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 13/04/23.
//

import Foundation
struct AnimalModelStructure {
    var animalSectionName: String
    var animalData: [AnimalModel]
    
    static func getAllAnimalObject() -> [AnimalModelStructure] {
        return [
            AnimalModelStructure(animalSectionName: "A",
                                 animalData: [AnimalModel(animalImage: "aardwolf", animalName: "Aardwolf")]),
            AnimalModelStructure(animalSectionName: "B", animalData: [AnimalModel(animalImage: "bear", animalName: "Bear"),
                                                                    AnimalModel(animalImage: "buffelo", animalName: "Buffelo")]),
            AnimalModelStructure(animalSectionName: "D", animalData: [AnimalModel(animalImage: "dog", animalName: "Dog"),
                                 AnimalModel(animalImage: "donkey", animalName: "Donkey")]),
            AnimalModelStructure(animalSectionName: "I", animalData: [ AnimalModel(animalImage: "iguana", animalName: "Iguana"),
                                                                       AnimalModel(animalImage: "ivybee", animalName: "Ivybee"),
                                                                       AnimalModel(animalImage: "iguana", animalName: "Iguana"),
                                                                       AnimalModel(animalImage: "ivybee", animalName: "Ivybee"),
                                                                       AnimalModel(animalImage: "iguana", animalName: "Iguana"),
                                                                       AnimalModel(animalImage: "ivybee", animalName: "Ivybee")]),
            AnimalModelStructure(animalSectionName: "L", animalData: [AnimalModel(animalImage: "lion", animalName: "Lion")]),
            AnimalModelStructure(animalSectionName: "T", animalData: [AnimalModel(animalImage: "tiger", animalName: "Tiger")]),
            AnimalModelStructure(animalSectionName: "Z", animalData: [AnimalModel(animalImage: "zibra", animalName: "Zebra")])
            
        ]
    }
}
