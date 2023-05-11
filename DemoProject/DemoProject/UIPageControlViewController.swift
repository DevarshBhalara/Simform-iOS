//
//  UIPageControlViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 11/04/23.
//

import UIKit

class UIPageControlViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var pageControltwo: UIPageControl!
    @IBOutlet private weak var view3: UIView!
    @IBOutlet private weak var view2: UIView!
    @IBOutlet private weak var view1: UIView!
    @IBOutlet private weak var pageControlThree: UIPageControl!
    @IBOutlet private weak var pageControlfour: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageControlTwo()
    }
    
    func configurePageControlTwo() {
        pageControltwo.numberOfPages = 3
        pageControltwo.currentPage = 0
        view1.isHidden = false
        view2.isHidden = true
        view3.isHidden = true
        pageControltwo.preferredCurrentPageIndicatorImage = UIImage(systemName: "sun.min")
        pageControlThree.pageIndicatorTintColor = UIColor.blue
        pageControlThree.currentPageIndicatorTintColor = UIColor.black
        pageControlfour.direction = UIPageControl.Direction.topToBottom
        /**Setting indicator image*/
//        pageControlThree.setIndicatorImage(UIImage(systemName: "plus"), forPage: 2)
    }
    
    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
        /**Setting indicator image on value change*/
//        sender.setIndicatorImage(UIImage(named: "icon"), forPage: sender.currentPage)
        print(sender.currentPage)
        print(sender.direction.rawValue)
     
        if (sender.currentPage == 0) {
            
            print("inside 0")
            view1.isHidden = false
            view2.isHidden = true
            view3.isHidden = true
        } else if (sender.currentPage == 1) {
            
            print("inside 1")
            view1.isHidden = true
            view2.isHidden = false
            view3.isHidden = true
        } else if (sender.currentPage == 2) {
            print("inside 2")
            view1.isHidden = true
            view2.isHidden = true
            view3.isHidden = false
        }
    }
}
