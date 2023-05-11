//
//  PatientViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 05/05/23.
//

import UIKit

class PatientViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var tfSearchBar: UITextField!
    
    @IBOutlet weak var stViewSearchBar: UIStackView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: - Variable
    let data = ["PaulZZ Demo", "MaxZZ Demo", "Nancie Demo", "Alfred ZZDemo", "Freddie ZZDemo", "Erica ZZDemo", "Bellonna ZZDemo", "Alexander ZZDemo"]
    var searchResult = [String]()
    var isSearchActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        tblView.dataSource = self
        tblView.delegate = self
        let image = UIImage()
        searchBar.setBackgroundImage(image, for: .any, barMetrics:  .defaultPrompt)
        searchBar.delegate = self
    }
}

//MARK: - Tableview Datasource
extension PatientViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isSearchActive ? searchResult.count : data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PatientTableViewCell") as? PatientTableViewCell else {
            return UITableViewCell()
        }
        isSearchActive ? cell.configureCell(data: searchResult[indexPath.row]) : cell.configureCell(data: data[indexPath.row])
        return cell
    }
}

//MARK: - Tableview Delegate
extension PatientViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true)
    }
}

//MARK: - Searchbar delegate
extension PatientViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchResult = searchText.isEmpty ? data : data.filter {
            $0.localizedCaseInsensitiveContains(searchText)
        }
        if searchResult.count == 0 {
            isSearchActive = false
        } else {
            isSearchActive = true
        }
        tblView.reloadData()
    }
}
