//
//  ViewControllerTableDemo.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/04/23.
//

import UIKit

class ViewControllerTableDemo: UIViewController {
    
    var arrAnimal = AnimalModel.getAllAnimal()
    let sectionArr = ["A","B","D","I","L","Z"]
    var count = 0
    
    

    @IBOutlet weak var tableAnimalView: UITableView!
    override func viewDidLoad() {
        tableAnimalView.register(UINib(nibName: "AnimalTableViewCell", bundle: nil), forCellReuseIdentifier: "animalCell")
        super.viewDidLoad()

    }
    


}

extension ViewControllerTableDemo: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return arrAnimal.filter { $0.animalName?.hasPrefix("A") ?? false }.count
        } else if section == 1 {
            return arrAnimal.filter { $0.animalName?.hasPrefix("B") ?? false }.count
        } else if section == 2 {
            return arrAnimal.filter { $0.animalName?.hasPrefix("D") ?? false }.count
        } else if section == 3 {
            return arrAnimal.filter { $0.animalName?.hasPrefix("I") ?? false }.count
        } else if section == 4 {
            return arrAnimal.filter { $0.animalName?.hasPrefix("L") ?? false }.count
        } else if section == 5 {
            return arrAnimal.filter { $0.animalName?.hasPrefix("Z") ?? false }.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArr[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieCell = tableView.dequeueReusableCell(withIdentifier: "animalCell") as? AnimalTableViewCell else {
            return UITableViewCell()
        }

        
        if indexPath.section == 0 {
            
            let indexOfMovieData = arrAnimal[indexPath.row + count ]
            movieCell.configAnimal(data: indexOfMovieData)
            count += 1
            return movieCell
            
        } else if indexPath.section == 1 {
            let indexOfMovieData = arrAnimal[indexPath.row + count]
            movieCell.configAnimal(data: indexOfMovieData)
            count += 1
            return movieCell
        } else {
            return UITableViewCell()
        }
    }
    
    
}
