//
//  TableViewExpandedController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 14/04/23.
//

import UIKit

class TableViewExpandedController: UIViewController {

    var longDescription = ExpandedModel.getAllData()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ExpandedTableViewCell", bundle: nil), forCellReuseIdentifier: "ExpandedTableViewCell")

    }
    

}

extension TableViewExpandedController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Collapse"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandedTableViewCell", for: indexPath) as? ExpandedTableViewCell else {
            return UITableViewCell()
        }
        
        let cellData = longDescription[indexPath.row]
        cell.configureCell(data: cellData)
        
        cell.expand = {
            self.longDescription[indexPath.row].isExpanded.toggle()
            print("Number of lines : \(cell.lblDescription.numberOfLines) is expanded : \(cell.btnMoreLess.isSelected)")
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        return cell
        
    }
}
