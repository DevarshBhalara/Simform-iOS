//
//  TableViewColorFruitsController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 13/04/23.
//

import UIKit

class TableViewColorFruitsController2: UIViewController {
    
    var refreshData: UIRefreshControl!

    var objectArr = FruitColorModel.getAllData()

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        self.refreshData = UIRefreshControl()
        tableView.addSubview(refreshData)
        self.refreshData.addTarget(self, action: #selector(loadData), for: .valueChanged)
        tableView.alwaysBounceVertical = true
        tableView.bounces = true
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedIndexPath, animated: animated)
            }
    }
    
    @objc func loadData() {
        print("Load data")
        self.refreshData.endRefreshing()
    }
}

extension TableViewColorFruitsController2: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(objectArr[section].data?.count ?? 0)
        return objectArr[section].data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectArr[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "fruits", for: indexPath) as? FruitTableViewCell,
              let colorCell = tableView.dequeueReusableCell(withIdentifier: "colors", for: indexPath) as? ColorTableViewCell else {
            return UITableViewCell()
            
        }
        
        
        switch indexPath.section {
            case 0 :
                
            cell.lblFruit.text = objectArr[indexPath.section].data?[indexPath.row]
                return cell
                
            case 1:
            
            colorCell.lblColor.text = objectArr[indexPath.section].data?[indexPath.row]

                if indexPath.row == objectArr[1].indexForSelectedFruit{
                    colorCell.btnSelect.isSelected = true
                    tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
                }
                return colorCell
                
            
            default:
                return UITableViewCell()
            }
    }
}

extension TableViewColorFruitsController2: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _,_,_  in
//            self.objectArr[indexPath.section].data?.remove(at: indexPath.row)
//            self.objectArr[indexPath.section].indexForSelectedFruit = -1
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//        deleteAction.image = UIImage(systemName: "trash")
//
//        deleteAction.backgroundColor = .red
//        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
//        return configuration
        
        let delete = UIContextualAction(style: .destructive, title: "delete") {
            (action, view, success:(Bool) -> Void) in
        }
        delete.backgroundColor = UIColor(cgColor: CGColor(red: 25/255, green: 33/255, blue: 37/255, alpha: 1))
        delete.title = "Delete"
        delete.image = UIImage(named: "trash")
        return UISwipeActionsConfiguration(actions: [delete])
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
                if let cell = tableView.cellForRow(at: indexPath as IndexPath) as? ColorTableViewCell{
                    print("Cell : \(cell)")
                    objectArr[1].indexForSelectedFruit = indexPath.row
                    cell.btnSelect.isSelected = true
                    print(cell.isSelected)
  
                }
            }
    }
    
   
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
                if let cell = tableView.cellForRow(at: indexPath as IndexPath) as? ColorTableViewCell{
                    print("Deselect : \(cell)")
                    cell.btnSelect.isSelected = false
                    print(cell.isSelected)
  
                }
            }
    }
    
    
    

//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if indexPath.section == 0 {
//            if editingStyle == .delete {
//                UITableViewCell.AccessoryType = .detailButton
//                objectArr[indexPath.section].data.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .automatic)
//            }
//        }
//
//    }
}

