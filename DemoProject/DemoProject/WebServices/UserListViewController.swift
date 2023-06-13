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
        ApiManager.request(urlString: "https://reqres.in/api/users?per_page=12", completion: {
            result in
            switch result {
            case .success(let data):
                do {
                    self.users = try JSONDecoder().decode(UserList.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.userTableVIew.reloadData()
                    }
                } catch let error {
                    print("Error \(error)")
                }
             
            case .failure(_):
                print("Fail to Call")
            }
        })
    }
    
    ///get Data from server using URLSession
//    private func getDataFromServer() {
//
//        if let url = URL(string: "https://reqres.in/api/users?page=2") {
//            let urlRequest = URLRequest(url: url)
//            let dataTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: {
//                (data, urlResponse, error) in
//
//                guard let responseData = data else {
//                    return
//                }
//                print("Data: \(responseData)")
//
//                if let urlResponse = urlResponse {
//                    print("urlResponse: \(urlResponse)")
//                }
//
//                if let error = error {
//                    print("Error: \(error)")
//                }
//
//                do {
//
//                    self.users = try JSONDecoder().decode(UserList.self, from: responseData)
//
//                    DispatchQueue.main.async {
//                        self.userTableVIew.reloadData()
//                    }
//
//
//                } catch let error {
//                    print("Error \(error.localizedDescription)")
//                }
//            })
//            dataTask.resume()
//        }
//    }

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
    
}
