//
//  UIPageControlViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 11/04/23.
//

import UIKit

class UIPageControlViewController: UIViewController {

    @IBOutlet weak var pageControltwo: UIPageControl!
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var pageControlThree: UIPageControl!
    
    @IBOutlet weak var pageControlfour: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageControlTwo()
        
        
        // Do any additional setup after loading the view.
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
        
//        pageControlThree.setIndicatorImage(UIImage(systemName: "plus"), forPage: 2)
    }
    
    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
//
       
//        sender.setIndicatorImage(UIImage(named: "icon"), forPage: sender.currentPage)
//
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
