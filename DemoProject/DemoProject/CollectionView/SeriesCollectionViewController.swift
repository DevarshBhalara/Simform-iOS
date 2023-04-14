//
//  SeriesCollectionViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 14/04/23.
//

import UIKit

class SeriesCollectionViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    var seriesModel = SeriesCollectionModel.getAllSeries()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

extension SeriesCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seriesModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seriesCell", for: indexPath) as! SeriesCollectionViewCell
        print(seriesModel[indexPath.row].seriesName)
        print(seriesModel[indexPath.row].seriesImage)
        cell.seriesImage.image = UIImage(named: seriesModel[indexPath.row].seriesImage ?? "avtar")
        cell.seriesName.text = seriesModel[indexPath.row].seriesName
        cell.seriesRating.text = seriesModel[indexPath.row].seriesRating
        return cell
    }
//    func indexTitles(for collectionView: UICollectionView) -> [String]? {
//        return ["a","b","c"]
//    }
    
}


extension SeriesCollectionViewController: UICollectionViewDelegate {
    
}

extension SeriesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2, height:  300)
    }
}
