//
//  UserListViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/06/23.
//

import UIKit

class UserListViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var userTableVIew: UITableView!
    
    //MARK: - Variables
    var users: UserList = UserList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getDataFromServer()
        getDataFromServerBaseApi()
    }
    
    ///get data using Base ApiManagerClass
    private func getDataFromServerBaseApi() {
        APIManager.shared.callAPI(urlString: "https://reqres.in/api/users?page=2") { [weak self]
            (result: Result<UserList, Error>) in
            
            switch result {
            case .success(let users):
                self?.users = users
                
                DispatchQueue.main.async {
                    self?.userTableVIew.reloadData()
                }
            case .failure(let error):
                    print("error \(error)")
            }
    
        }
    }
    
    //Show dialog for delete
    private func showAlertDialog(indexPath: IndexPath) {
        let alert = UIAlertController(title: "Are you sure?", message: "Do you want to delete user with id \(indexPath.row) ? ", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {_ in
            self.users.data.remove(at: indexPath.row)
            self.userTableVIew.deleteRows(at: [indexPath], with: .automatic)
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }

}

//MARK: - TableView Datasource
extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let userCell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell else {
            return UITableViewCell()
        }
        userCell.configureCell(user: users.data[indexPath.row])
        return userCell
    }
}

//MARK: - TableView Delegate
extension UserListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _,_,_ in
            
            APIManager.shared.callAPI(urlString: "https://reqres.in/api/users/\(indexPath.row)", requestMethod: .delete) {
                (result: Result<DeleteResponse, Error>) in
                
                switch result {
                case .success(let response):
                    print("\(response.code ?? 0)")
                    DispatchQueue.main.async {
                        self?.showAlertDialog(indexPath: indexPath)
                       
                    }
                    
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
        
    }
    
    
}
