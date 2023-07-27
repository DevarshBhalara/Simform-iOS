//
//  CoreDataViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 27/07/23.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfMobileNumber: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var btnAddUser: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSavedData()
    }
    
    @IBAction func btnAddAction(_ sender: UIButton) {
        createData(userName: tfUserName.text ?? "", email: tfEmail.text ?? "", mobile: tfMobileNumber.text ?? "0", password: tfPassword.text ?? "")
    }
    
    @IBAction func btnViewAllUserAction(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewAlluserViewController") as? ViewAlluserViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func createData(userName: String, email: String, mobile: String, password: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName: "UserCoreData", in: managedContext)!
        
        
        let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
        user.setValue(userName, forKeyPath: "username")
        user.setValue(email, forKey: "email")
        user.setValue(password, forKey: "password")
        user.setValue(mobile, forKey: "mobilenumber")
        
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    private func getSavedData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserCoreData")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "username") ?? "N/A")
                print(data.value(forKey: "mobilenumber") ?? "N/A")
                print(data.value(forKey: "password") ?? "N/A")
                print(data.value(forKey: "email") ?? "N/A")
                print()
            }
        } catch {
            print("Fail")
        }
        
    }

}
