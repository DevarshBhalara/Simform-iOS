//
//  AnimalModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/04/23.
//

import Foundation
class AnimalModel: NSObject {
    var animalImage: String?
    var animalName: String?
    
    override init() {
        super.init()
    }
    
    init(_ img: String, _ name: String) {
        animalName = name
        animalImage = img
    }
    
    static func getAllAnimal() -> [AnimalModel] {
        return [
            AnimalModel("aardwolf", "Aardwolf"),
            AnimalModel("bear", "Bear"),
            AnimalModel("buffelo", "Buffelo"),
            AnimalModel("dog", "Dog"),
            AnimalModel("donkey", "Donkey"),
            AnimalModel("iguana", "Iguana"),
            AnimalModel("ivybee", "Ivybee"),
            AnimalModel("lion", "Lion"),
            AnimalModel("tiger", "Tiger"),
            AnimalModel("zibra", "Zibra")
        ]
    }
}
