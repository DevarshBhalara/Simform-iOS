//
//  AnimalModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/04/23.
//

import Foundation
struct AnimalModel {
    var animalImage: String?
    var animalName: String?
    
  
    static func getAllAnimal() -> [AnimalModel] {
        return [
            AnimalModel(animalImage: "aardwolf", animalName: "Aardwolf"),
            AnimalModel(animalImage: "bear", animalName: "Bear"),
            AnimalModel(animalImage: "buffelo", animalName: "Buffelo"),
            AnimalModel(animalImage: "dog", animalName: "Dog"),
            AnimalModel(animalImage: "donkey", animalName: "Donkey"),
            AnimalModel(animalImage: "iguana", animalName: "Iguana"),
            AnimalModel(animalImage: "ivybee", animalName: "Ivybee"),
            AnimalModel(animalImage: "lion", animalName: "Lion"),
            AnimalModel(animalImage: "tiger", animalName: "Tiger"),
            AnimalModel(animalImage: "zibra", animalName: "Zibra")
        ]
    }
    
    static func getAllAnimalDict() -> [String: [AnimalModel]] {
        return [
            "A" : [AnimalModel(animalImage: "aardwolf", animalName: "Aardwolf")],
            "B" : [AnimalModel(animalImage: "bear", animalName: "Bear"),
                   AnimalModel(animalImage: "buffelo", animalName: "Buffelo")],
            "D" : [AnimalModel(animalImage: "dog", animalName: "Dog"),
                   AnimalModel(animalImage: "donkey", animalName: "Donkey")],
            "I" : [ AnimalModel(animalImage: "iguana", animalName: "Iguana"),
                    AnimalModel(animalImage: "ivybee", animalName: "Ivybee"),
                    AnimalModel(animalImage: "iguana", animalName: "Iguana"),
                    AnimalModel(animalImage: "ivybee", animalName: "Ivybee"),
                    AnimalModel(animalImage: "iguana", animalName: "Iguana"),
                    AnimalModel(animalImage: "ivybee", animalName: "Ivybee")],
            "L" : [AnimalModel(animalImage: "lion", animalName: "Lion"),],
            "T" : [AnimalModel(animalImage: "tiger", animalName: "Tiger"),],
            "Z" : [AnimalModel(animalImage: "zibra", animalName: "Zibra")]
        ]
        
    }
}
