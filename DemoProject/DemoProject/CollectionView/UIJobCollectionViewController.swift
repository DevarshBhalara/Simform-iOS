//
//  UIJobCollectionViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 17/04/23.
//

import UIKit

class UIJobCollectionViewController: UIViewController {
    
    var jobCompanyModelArray = JobModel.getAllJobs()
    var jobSliderBackgroundColor = [
        UIColor(red: 255, green: 0, blue: 255, alpha: 1),
        UIColor(red: 20, green: 128, blue: 128, alpha: 1),
        UIColor(red: 20, green: 165 , blue: 0, alpha: 1)
    ]
    
    
    //MARK: - Outlets
    @IBOutlet weak var jobSliderCollectionView: UICollectionView!
    @IBOutlet weak var jobSliderPageControl: UIPageControl!
    @IBOutlet weak var jobCompanyCollectionView: UICollectionView!
    
    var refreshdata: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshdata = UIRefreshControl()
        jobCompanyCollectionView.dataSource = self
        self.jobCompanyCollectionView.addSubview(refreshdata)
        jobCompanyCollectionView.bounces = true
        jobCompanyCollectionView.alwaysBounceHorizontal = true
        refreshdata.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
    @objc func loadData() {
        print("refreshing")
    }
    
    @IBAction func indicatorValueChange(_ sender: UIPageControl) {
        print(sender.currentPage)
        jobSliderCollectionView.scrollToItem(at: IndexPath(item: sender.currentPage, section: 0), at: .right, animated: true)
    }
    
    
}

extension UIJobCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == jobSliderCollectionView {
            return 3
        } else {
            return jobCompanyModelArray.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == jobSliderCollectionView {
            guard let sliderCell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as? JobSliderCellCollectionViewCell else {
                return UICollectionViewCell()
            }
            sliderCell.configureItem(data: sliderCell)
            return sliderCell
            
        } else {
            guard let companyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "companyCell", for: indexPath) as? JobCompanyCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            companyCell.configureItem(cell: companyCell, data: jobCompanyModelArray[indexPath.row])
            return companyCell
            
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if collectionView == jobSliderCollectionView {
            print("will Display \(indexPath.row)")
            jobSliderPageControl.currentPage = indexPath.row
            jobSliderPageControl.setCurrentPageIndicatorImage(UIImage(systemName: "capsule.fill"), forPage: jobSliderPageControl.currentPage)

            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == jobSliderCollectionView {
            print("will Display \(indexPath.row)")
            jobSliderPageControl.currentPage = collectionView.indexPathsForVisibleItems[0].row
        }
    }
}

extension UIJobCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == jobSliderCollectionView {
            return CGSize(width: collectionView.frame.size.width - 20, height: 170)
        } else {
            return CGSize(width: collectionView.frame.size.width/2 - 20, height: 170)
        }
       
    }
    
    
}
