//
//  UserListAlamoFireViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 15/06/23.
//

import UIKit

class UserListAlamoFireViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variable
    let url = "https://reqres.in/api/users?page=2"
    var users = UserList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataOfUser()
    }
    
    private func getDataOfUser() {
        ApiManagerAF.shared.callAPI(urlString: url, method: .get) { [weak self]
            (result: Result<UserList, Error>) in
            switch result {
            case .success(let users) :
                self?.users = users
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
}

//MARK: - TableView Datasource
extension UserListAlamoFireViewController: UITableViewDataSource {
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
extension UserListAlamoFireViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
