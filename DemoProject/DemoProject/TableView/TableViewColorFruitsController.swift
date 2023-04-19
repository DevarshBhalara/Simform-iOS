//
//  TableViewColorFruitsController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 13/04/23.
//

import UIKit

class TableViewColorFruitsController: UIViewController {
    
    var refreshData: UIRefreshControl!

    var fruitColorModelArray = FruitColorModel.getAllDataFruitColorModel()
  
    //MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        self.refreshData = UIRefreshControl()
        tableView.addSubview(refreshData)
        self.refreshData.addTarget(self, action: #selector(loadData), for: .valueChanged)
        tableView.alwaysBounceVertical = true
        tableView.bounces = true
        super.viewDidLoad()
    }
    
    
    @objc func loadData() {
        print("Load data")
        self.refreshData.endRefreshing()
    }
}

extension TableViewColorFruitsController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(fruitColorModelArray[section].data?.count ?? 0)
        
        if section == 1 {
            return fruitColorModelArray[section].dataAgain?.count ?? 0
        } else {
            return fruitColorModelArray[section].data?.count ?? 0
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return fruitColorModelArray[section].sectionName
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = /*tableView.dequeueReusableCell(withIdentifier: "fruits") as? FruitTableViewCell,
              let colorCell = */tableView.dequeueReusableCell(withIdentifier: "colors") as? ColorTableViewCell else {
            return UITableViewCell()
            
        }
        
        
        switch indexPath.section {
        case 0 :
            
            let fruitData = fruitColorModelArray[indexPath.section].data?[indexPath.row] ?? ""
            cell.configureCellFruit(data: fruitData)
            return cell
            
        case 1:

            let colorData = fruitColorModelArray[indexPath.section].dataAgain?[indexPath.row] ?? FruitColorData(name: "NA")
            cell.configureCell(data: colorData)
            
//            if fruitColorModelArray[indexPath.section].dataAgain?[indexPath.row].isSelectedColor == true {
//                print("Inside true")
//                colorCell.btnSelect.isSelected = true
//            } else {
//                print("Inside false")
//                colorCell.btnSelect.isSelected = false
//            }
            
            if let selectedRow = tableView.indexPathForSelectedRow?.row {
                if selectedRow == indexPath.row {
                    cell.btnSelected()
                }
            } else if fruitColorModelArray[1].dataAgain?[indexPath.row].isSelectedColor == true {
                cell.btnSelected()
            }
            return cell
            
            
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
                    //                   fruitColorModelArray[1].indexForSelectedFruit = indexPath.row
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
        
    }

