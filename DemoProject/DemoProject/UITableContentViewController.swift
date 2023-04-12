//
//  UITableContentViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/04/23.
//

import UIKit

class UITableContentViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var tblHeaderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "IndexTableViewCell", bundle: nil), forCellReuseIdentifier: "IndexTableViewCell")
        tableView.register(UINib(nibName: "EvenTableViewCell", bundle: nil), forCellReuseIdentifier: "EvenTableViewCell")
        tblHeaderView.frame = CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 50)
        tblHeaderView.frame.origin.y = 0
        tableView.tableHeaderView = tblHeaderView
    }

}

//MARK: - UITable Datasourse

extension UITableContentViewController: UITableViewDataSource {
    
    //number of section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    //how many rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 20
        } else if section == 1{
            return 30
        } else {
            return 0
        }
    }
    
    
    //for cell in table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let oddCell = tableView.dequeueReusableCell(withIdentifier: "IndexTableViewCell") as? IndexTableViewCell else {
            return UITableViewCell()
        }
        
        
        guard let evenCell = tableView.dequeueReusableCell(withIdentifier: "EvenTableViewCell") as? EvenTableViewCell else {
            return UITableViewCell()
        }
        
        if indexPath.row % 2 == 0 {
            evenCell.lblEvenText.text = "Even : \(indexPath.row)"
            evenCell.backgroundColor = .gray
            
            return evenCell
        } else {
            oddCell.lblNumber.text = "Odd : \(indexPath.row)"
            oddCell.backgroundColor = .lightGray
            return oddCell
            
        }
        
    }
    
    //title for section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    
    //height for section header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    //height for cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 70
        return UITableView.automaticDimension
    }
    
}


// MARK: - UITableView Delegate

extension UITableContentViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
