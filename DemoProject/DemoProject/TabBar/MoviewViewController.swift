//
//  MovieViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 19/04/23.
//

import UIKit

class MovieViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
//    let movieData = MovieSeriesModel.getAllMovies()
    let allMovies = MovieModelStructure.getAllMovies()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
    }


}
extension MovieViewController: UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        allMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allMovies[section].movieData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(data: allMovies[indexPath.section].movieData[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as? MovieHeaderView
        header?.lblHeader.text = allMovies[indexPath.section].sectionName
        return header ?? UICollectionReusableView()
        
    }
}

extension MovieViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: view.frame.size.width / 2 - 20, height: 200)
    }
    
}

extension MovieViewController: UICollectionViewDelegate {
    
}
