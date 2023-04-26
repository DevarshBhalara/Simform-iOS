//
//  SeriesCollectionViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 14/04/23.
//

import UIKit

class SeriesCollectionViewController: UIViewController {
    
    var seriesModel = SeriesCollectionModel.getAllSeries()
    var searchResultSeriesModel = [SeriesCollectionModel]()
    var isSearchActive: Bool = false
    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var seachBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seachBar.delegate = self
        seachBar.setImage(UIImage(systemName: "trash"), for: .search, state: .normal)
        seachBar.setImage(UIImage(systemName: "trash.fill"), for: .clear, state: .normal)
        seachBar.autocapitalizationType = .none
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        let height = collectionView.collectionViewLayout.collectionViewContentSize.height
//        myCollectionViewHeight.constant = height
//        self.view.layoutIfNeeded()
//    }
    

}

extension SeriesCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return isSearchActive ? searchResultSeriesModel.count : seriesModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seriesCell", for: indexPath) as? SeriesCollectionViewCell else {
            return UICollectionViewCell()
        }

        isSearchActive ? cell.configureCell(data: searchResultSeriesModel[indexPath.row]) : cell.configureCell(data: seriesModel[indexPath.row])

        /** Wihtout Filter collection view configurationcell */
//        let seriesData = seriesModel[indexPath.row]
//        cell.configureCell(data: seriesData)
        return cell
    }
}

extension SeriesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 2 - 20, height:  collectionView.frame.size.height / 2)
    }

}

extension SeriesCollectionViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("did begin editing")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("did end editing")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Search button clicked")
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchResultSeriesModel = searchText.isEmpty ? seriesModel : seriesModel.filter { $0.seriesName?.lowercased().starts(with: searchText) ?? false
        }
            
        if searchResultSeriesModel.count == 0 {
            isSearchActive = false
        } else {
            isSearchActive = true
        }
        collectionView.reloadData()
        print(searchResultSeriesModel.count)
        print(searchText)
        
    }
    
}

