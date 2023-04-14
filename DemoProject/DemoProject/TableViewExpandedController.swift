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
        // Do any additional setup after loading the view.
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
        cell.lblDescription.text = longDescription[indexPath.row].data
        cell.btnMoreLess.isSelected = longDescription[indexPath.row].isExpanded
        cell.expand = { isExpanded in
           
                //   print("reload \(indexPath) \(isExpanded)")
            // tableView.reloadRows(at: [indexPath], with: .automatic)
            self.longDescription[indexPath.row].isExpanded = isExpanded
           // tableView.reloadRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
            }
        return cell
        
    }
    
    
}

extension TableViewExpandedController: UITableViewDelegate {
    
}
