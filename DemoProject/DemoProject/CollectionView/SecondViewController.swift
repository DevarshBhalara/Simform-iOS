//
//  SecondViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 13/04/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblTableView: UICollectionView!
    let nameArr = ["Devarsh", "krunal", "savan", "raj", "jay"]
    var refreshData: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshData = UIRefreshControl()
        refreshData.tintColor = .darkGray
        lblTableView.addSubview(refreshData)
        lblTableView.alwaysBounceVertical = true
        lblTableView.bounces = true
        refreshData.addTarget(self, action: #selector(loadData), for: .valueChanged)
      
        
        // Do any additional setup after loading the view.
    }
    
    @objc func loadData() {
        print("Load data")
        refreshData.endRefreshing()
    }
    

}

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as! SecondCollectionViewCell
        itemCell.configureCell(data: nameArr[indexPath.row])
        return itemCell
    }
}

extension SecondViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width/2-10, height: 40)
    }
}
