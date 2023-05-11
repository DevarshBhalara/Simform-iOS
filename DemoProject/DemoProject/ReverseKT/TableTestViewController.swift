//
//  TableTestViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 01/05/23.
//

import UIKit

class TableTestViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension TableTestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TestTableViewCell
        cell?.label.text = "Hello"
        return cell ?? UITableViewCell()
    }
    
    
}

extension TableTestViewController: UITableViewDelegate {
    
}
