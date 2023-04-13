//
//  TableViewColorFruitsController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 13/04/23.
//

import UIKit

class TableViewColorFruitsController: UIViewController {
    
    var refreshData: UIRefreshControl!

    struct Model {
        var sectionName: String
        var data : [String]
        var isSelect: Bool = false
        
        static func getAllData() -> [Model] {
          return [  Model(sectionName: "Fruits", data: ["Apple", "Banana" , "Mango"]),
            Model(sectionName: "Colors", data: ["patato", "tomato", "Loki"]) ]
        }
    }
    
    var objectArr = Model.getAllData()

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        self.refreshData = UIRefreshControl()
        tableView.addSubview(refreshData)
        self.refreshData.addTarget(self, action: #selector(loadData), for: .valueChanged)
        tableView.alwaysBounceVertical = true
        tableView.bounces = true
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    @objc func loadData() {
        print("Load data")
        self.refreshData.endRefreshing()
    }
}

extension TableViewColorFruitsController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(objectArr[section].data.count)
        return objectArr[section].data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectArr[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
            case 0 :
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "fruits") as? FruitTableViewCell else {
                    return UITableViewCell()
                    
                }
                cell.lblFruit.text = objectArr[indexPath.section].data[indexPath.row]
                return cell
                
            case 1:
                guard let colorCell = tableView.dequeueReusableCell(withIdentifier: "colors") as? ColorTableViewCell else {
                    return UITableViewCell()
                }
            
                colorCell.lblColor.text = objectArr[indexPath.section].data[indexPath.row]
            
                if indexPath.row == 1 {
                    colorCell.btnSelect.isSelected = true
                    tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
                }
//                if colorCell.isSelected {
//                    colorCell.btnSelect.backgroundColor = .black
//                } else {
//                    colorCell.btnSelect.backgroundColor = .blue
//                }
                return colorCell
                
            
            default:
                return UITableViewCell()
            }
            

    }
    

    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
//            self.objectArr[indexPath.section].data.remove(at: indexPath.row)
//                    self.tableView.deleteRows(at: [indexPath], with: .automatic)
//                    complete(true)
//                }
//                
//                deleteAction.backgroundColor = .red
//                
//                let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
//                configuration.performsFirstActionWithFullSwipe = true
//                return configuration
//    }
    
    

     
    
}

extension TableViewColorFruitsController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        if indexPath == tableView.indexPathForSelectedRow {
//            return nil
//        }
//        return indexPath
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
                if let cell = tableView.cellForRow(at: indexPath as IndexPath) as? ColorTableViewCell{
                    print("Cell : \(cell)")
                    cell.btnSelect.isSelected = true
                    print(cell.isSelected)
  
                }
            }
        
    }
    
   
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
                if let cell = tableView.cellForRow(at: indexPath as IndexPath) as? ColorTableViewCell{
                    print("Cell : \(cell)")
                    cell.btnSelect.isSelected = false
                    print(cell.isSelected)
  
                }
            }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.section == 1 {
            return indexPath
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if editingStyle == .delete {
                objectArr[indexPath.section].data.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
        
    }
}

