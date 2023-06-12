//
//  UITableAnimalViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/04/23.
//

import UIKit

class UITableAnimalViewController: UIViewController {

    //MARK: Variables
    var animalStructArray = AnimalModelStructure.getAllAnimalObject()
    
    //MARK: - Outlets
    @IBOutlet weak var tableViewAnimal: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        tableViewAnimal.dataSource = self
        tableViewAnimal.register(UINib(nibName: "AnimalTableViewCell", bundle: nil), forCellReuseIdentifier: "animalCell")
    }
    
}

//MARK: - Tableview Datasource
extension UITableAnimalViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return animalStructArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalStructArray[section].animalData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalStructArray[section].animalSectionName
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let animalCell = tableView.dequeueReusableCell(withIdentifier: "animalCell") as? AnimalTableViewCell else {
            return UITableViewCell()
        }
        
        let animalData = animalStructArray[indexPath.section].animalData[indexPath.row]
        animalCell.configureCell(data: animalData)
        return animalCell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["A", "B", "C" , "D", "E", "F" , "G" , "H" , "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" ]
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return animalStructArray.map { $0.animalSectionName }.firstIndex(of: title) ?? -1
    }
}






