//
//  UITableAnimalViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/04/23.
//

import UIKit

class UITableAnimalViewController: UIViewController {

    var arrAnimal = AnimalModel.getAllAnimal()
    let sectionArr = ["A","B","D","I","L","Z"]
    
    
    //MARK: - Outlets
    @IBOutlet weak var tableViewAnimal: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewAnimal.delegate = self
        tableViewAnimal.dataSource = self
        tableViewAnimal.register(UINib(nibName: "AnimalTableViewCell" , bundle: nil), forHeaderFooterViewReuseIdentifier: "animalCell")

    }

}

extension UITableAnimalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell") as? AnimalTableViewCell else {
            print("nil")
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArr.count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArr[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else {
            return 0
        }
    }
    
 
    
    
}

extension UITableAnimalViewController: UITableViewDelegate {
    
}
