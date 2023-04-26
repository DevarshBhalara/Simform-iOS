//
//  GolfHomeViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 26/04/23.
//

import UIKit

class GolfHomeViewController: UIViewController {
    
    
    @IBOutlet weak var tableHeader: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonUpdateScore: UIStackView!
    @IBOutlet weak var whiteColorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    private func setupUI() {
        
       
        tableHeader.frame = CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 400)
        tableHeader.frame.origin.y = 0
        tableView.tableHeaderView = tableHeader
        
        
    }
}
