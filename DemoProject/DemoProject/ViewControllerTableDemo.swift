//
//  ViewControllerTableDemo.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/04/23.
//

import UIKit

class ViewControllerTableDemo: UIViewController {
    
    var arrAnimal = AnimalModel.getAllAnimal()
    var animalDict = AnimalModel.getAllAnimalDict()
    lazy var keyArr = animalDict.keys.map { String($0) }.sorted()
    
    struct Objects {
        var sectionName: String!
        var sectionObjects: [AnimalModel]!
    }
    
    var objectArray = [Objects]()
//    let sectionArr = ["A","B","D","I","L","Z"]
//    var count = 0
    
    
    @IBOutlet weak var tableAnimalView: UITableView!
    override func viewDidLoad() {
        tableAnimalView.register(UINib(nibName: "AnimalTableViewCell", bundle: nil), forCellReuseIdentifier: "animalCell")
        
        for (key, value) in animalDict.sorted(by: { $0.key < $1.key }) {
            print("\(key) \(value)")
            objectArray.append(Objects(sectionName: key, sectionObjects: value))
        }
        
        
        super.viewDidLoad()

    }
    


}

extension ViewControllerTableDemo: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        print(objectArray[section].sectionObjects.count)
        return objectArray[section].sectionObjects.count
//        return animalDict[keyArr[section]]?.count ?? 0
        
//        if section == 0 {
////            return arrAnimal.filter { $0.animalName?.hasPrefix("A") ?? false }.count
//            return animalDict["A"]?.count ?? 0
//
//        } else if section == 1 {
////            return arrAnimal.filter { $0.animalName?.hasPrefix("B") ?? false }.count
//            return animalDict["B"]?.count ?? 0
//
//        } else if section == 2 {
//            //            return arrAnimal.filter { $0.animalName?.hasPrefix("D") ?? false }.count
//            return animalDict["D"]?.count ?? 0
//
//        } else if section == 3 {
////            return arrAnimal.filter { $0.animalName?.hasPrefix("I") ?? false }.count
//            return animalDict["I"]?.count ?? 0
//
//        } else if section == 4 {
////            return arrAnimal.filter { $0.animalName?.hasPrefix("L") ?? false }.count
//            return animalDict["L"]?.count ?? 0
//
//        } else if section == 5 {
////            return arrAnimal.filter { $0.animalName?.hasPrefix("Z") ?? false }.count
//            return animalDict["T"]?.count ?? 0
//
//        } else if section == 6 {
//            return animalDict["Z"]?.count ?? 1
//
//        } else {
//            return 1
//        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sectionArr[section]
//        let sections = animalDict.keys.map { key in String(key) }.sorted()
//        print(sections)
        return objectArray[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let animalCell = tableView.dequeueReusableCell(withIdentifier: "animalCell") as? AnimalTableViewCell else {
            return UITableViewCell()
        }
        
        animalCell.lblAnimalName.text = objectArray[indexPath.section].sectionObjects[indexPath.row].animalName
        
        return animalCell

        
//        if indexPath.section == 0 {
//
//            let dataOfAnimal = animalDict["A"]
//            animalCell.configAnimal(data: dataOfAnimal?[indexPath.row] ?? AnimalModel())
//            return animalCell
//
////            let indexOfMovieData = arrAnimal[indexPath.row]
////            animalCell.configAnimal(data: indexOfMovieData)
////            return animalCell
//
//        } else if indexPath.section == 1 {
//
//            let dataOfAnimal = animalDict["B"]
//            animalCell.configAnimal(data: dataOfAnimal?[indexPath.row] ?? AnimalModel())
//            return animalCell
//
////            let indexOfMovieData = arrAnimal[indexPath.row]
////            animalCell.configAnimal(data: indexOfMovieData)
////            return animalCell
//
//        } else if indexPath.section == 2 {
//
//            let dataOfAnimal = animalDict["D"]
//            animalCell.imgAnimal.image = UIImage(named: dataOfAnimal?[indexPath.row].animalImage ?? "")
//            animalCell.lblAnimalName.text = dataOfAnimal?[indexPath.row].animalName ?? ""
//            return animalCell
//
////            let indexOfMovieData = arrAnimal[indexPath.row]
////            animalCell.configAnimal(data: indexOfMovieData)
////            return animalCell
//
//        } else if indexPath.section == 3 {
//
//            let dataOfAnimal = animalDict["I"]
//            animalCell.configAnimal(data: dataOfAnimal?[indexPath.row] ?? AnimalModel())
//            return animalCell
//
////            let indexOfMovieData = arrAnimal[indexPath.row]
////            animalCell.configAnimal(data: indexOfMovieData)
////            return animalCell
//
//        } else if indexPath.section == 4 {
//
//            let dataOfAnimal = animalDict["L"]
//            animalCell.configAnimal(data: dataOfAnimal?[indexPath.row] ?? AnimalModel())
//            return animalCell
//
////            let indexOfMovieData = arrAnimal[indexPath.row]
////            animalCell.configAnimal(data: indexOfMovieData)
////            return animalCell
//
//        } else if indexPath.section == 5 {
//
//            let dataOfAnimal = animalDict["T"]
//            animalCell.configAnimal(data: dataOfAnimal?[indexPath.row] ?? AnimalModel())
//            return animalCell
//
////            let indexOfMovieData = arrAnimal[indexPath.row]
////            animalCell.configAnimal(data: indexOfMovieData)
////            return animalCell
//
//        } else if indexPath.section == 6 {
//
//
//
//            let dataOfAnimal = animalDict["Z"]
//            print("Z : \(dataOfAnimal?[indexPath.row].animalName ?? "")")
//            animalCell.configAnimal(data: dataOfAnimal?[indexPath.row] ?? AnimalModel())
//            return animalCell
//
////            let indexOfMovieData = arrAnimal[indexPath.row]
////            animalCell.configAnimal(data: indexOfMovieData)
////            return animalCell
//
//        } else {
//            return UITableViewCell()
//        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["A", "B", "C" , "D", "E", "F" , "G" , "H" , "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" ]
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
    
        return animalDict.keys.map { String($0) }.sorted().firstIndex(of: title) ?? 0
    }
    
    
}

extension ViewControllerTableDemo: UITableViewDelegate {

}

