//
//  UITableContentViewController2.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/04/23.
//

import UIKit

class UITableContentViewController2: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCellOneFor2", bundle: nil), forCellReuseIdentifier: "cell1")
        
        // Do any additional setup after loading the view.
    }
}

extension UITableContentViewController2: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 10
        } else {
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as? TableViewCellOneFor2 else {
            print("hello")
            return UITableViewCell()
        }
        
        cell.lblText.text = "HEllo"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 70
        return UITableView.automaticDimension
    }
    
}

extension UITableContentViewController2: UITableViewDelegate {
    
}
