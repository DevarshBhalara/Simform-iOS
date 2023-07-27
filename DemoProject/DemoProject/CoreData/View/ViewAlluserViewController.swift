//
//  ViewAlluserViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 27/07/23.
//

import UIKit
import CoreData

class ViewAlluserViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tblViewUser: UITableView!
    
    // MARK: - Variables
    var users: [UserCoreData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSavedData()
    }
    
    private func getSavedData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserCoreData")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            users.append(contentsOf: result as! [UserCoreData])
            tblViewUser.reloadData()
        } catch {
            print("Fail")
        }
    }
    
    private func deleteUser(user: UserCoreData) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
   
        /** Delete with user name */
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserCoreData")
//        fetchRequest.predicate = NSPredicate(format: "username=%@", "Devarsh")
//
//        do{
//            let test = try managedContext.fetch(fetchRequest)
//            let objToDeleted = test[0] as! NSManagedObject
//            managedContext.delete(objToDeleted)
//            try managedContext.save()
//        } catch {
//            print(error)
//        }
        
        managedContext.delete(user)
        
        
    }
}

// MARK: - Tableview datasource
extension ViewAlluserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserListCell") as? UserListCell else {
            return UITableViewCell()
        }
        cell.configureCell(data: users[indexPath.row])
        return cell
    }
}

// MARK: Tableview delegate
extension ViewAlluserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "UpdateUserViewController") as? UpdateUserViewController else {
            return
        }
        vc.complition = { 
            tableView.reloadData()
        }
        vc.user = users[indexPath.row]
        navigationController?.present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteUser(user: users[indexPath.row])
            users.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
