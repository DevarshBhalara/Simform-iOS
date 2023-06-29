//
//  WebServiceViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 19/06/23.
//

import UIKit

class WebServiceViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tblView: UITableView!
    
    //MARK: - Variable
    var getAllScreenData = CombineScreenDataWebService.getAllData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

//MARK: TableView Datasource
extension WebServiceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        getAllScreenData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WebServiceCell") as? WebServiceCell else {
            return UITableViewCell()
        }
        
        cell.confiureCell(data: getAllScreenData[indexPath.row].title)
        return cell
    }
}

//MARK: - tableview delegate
extension WebServiceViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = getAllScreenData[sourceIndexPath.row]
        getAllScreenData.remove(at: sourceIndexPath.row)
        getAllScreenData.insert(item, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            navigationController?.navigationItem.largeTitleDisplayMode = .never
            let appCoordinator = AppCoordinator(navigationController: navigationController!)
            UserManager.shared.sceneDelegate?.appCoordinator = appCoordinator
            appCoordinator.start()
            
           
        } else {
            let viewController = UIStoryboard(name: getAllScreenData[indexPath.row].storyBoardName, bundle: nil).instantiateViewController(withIdentifier: getAllScreenData[indexPath.row].vcName)
            viewController.navigationItem.largeTitleDisplayMode = .never
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
    }
}


//MARK: - ScrollView delegate
extension WebServiceViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= 0 {
            print("Large")
            UIView.animate(withDuration: 0.8) {
                self.navigationItem.largeTitleDisplayMode = .always
            }
        } else {
            print("Small")
            UIView.animate(withDuration: 0.8) {
                self.navigationItem.largeTitleDisplayMode = .always
            }
        }
    }
}
