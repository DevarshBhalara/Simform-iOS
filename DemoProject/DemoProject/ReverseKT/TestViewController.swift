//
//  TestViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 26/04/23.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet var header: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.frame = CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 400)
        header.frame.origin.y = 0
        tableView.tableHeaderView = header
        
    }
    

}
