//
//  TableViewColorFruitsController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 13/04/23.
//

import UIKit

class TableViewColorFruitsController: UIViewController {
    
    var refreshData: UIRefreshControl!

    var fruitColorModelArray = FruitColorModel.getAllDataAgain()

    
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
    }
    
    @objc func loadData() {
        print("Load data")
        self.refreshData.endRefreshing()
    }
}

extension TableViewColorFruitsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 91
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fruitColorModelArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(fruitColorModelArray[section].data?.count ?? 0)
        return fruitColorModelArray[section].dataAgain?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return fruitColorModelArray[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
            case 0 :
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "fruits", for: indexPath) as? FruitTableViewCell else {
                    return UITableViewCell()
                    
                }
            cell.lblFruit.text = fruitColorModelArray[indexPath.section].data?[indexPath.row]
                return cell
                
            case 1:
                guard let colorCell = tableView.dequeueReusableCell(withIdentifier: "colors", for: indexPath) as? ColorTableViewCell else {
                    return UITableViewCell()
                }
            
            colorCell.lblColor.text = fruitColorModelArray[indexPath.section].dataAgain?[indexPath.row].name
            
            if let selectedRow = tableView.indexPathForSelectedRow?.row {
                if selectedRow == indexPath.row {
                    colorCell.btnSelect.isSelected = true
                }
            } else if fruitColorModelArray[1].dataAgain?[indexPath.row].isSelectedColor == true {
                colorCell.btnSelect.isSelected = true
                tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            }
            return colorCell
                
            
            default:
                return UITableViewCell()
            }
    }
}

extension TableViewColorFruitsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _,_,_  in
            self?.fruitColorModelArray[indexPath.section].dataAgain?.remove(at: indexPath.row)
            self?.fruitColorModelArray[indexPath.section].indexForSelectedFruit = -1
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteAction.image = UIImage(systemName: "trash")
        
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
                if let cell = tableView.cellForRow(at: indexPath as IndexPath) as? ColorTableViewCell{
                    print("Cell : \(cell)")
//                    fruitColorModelArray[1].indexForSelectedFruit = indexPath.row
                    fruitColorModelArray[1].dataAgain?[indexPath.row].isSelectedColor = true
                    cell.btnSelect.isSelected = true
                    print(cell.isSelected)
  
                }
            }
    }
    
   
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
                if let cell = tableView.cellForRow(at: indexPath as IndexPath) as? ColorTableViewCell{
                    print("Deselect : \(cell)")
                    fruitColorModelArray[1].dataAgain?[indexPath.row].isSelectedColor = false
                    cell.btnSelect.isSelected = false
                    print(cell.isSelected)
  
                }
            }
    }
    

//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if indexPath.section == 0 {
//            if editingStyle == .delete {
//                objectArr[indexPath.section].data.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .automatic)
//            }
//        }
//
//    }
}

