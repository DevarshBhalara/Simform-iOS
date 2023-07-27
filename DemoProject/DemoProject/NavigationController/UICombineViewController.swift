//
//  UICombineViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 04/05/23.
//

import UIKit

struct CombineScreenData {
    let storyBoardName: String
    let vcName: String
    let title: String
    static private let autoLayoutStoryBoardName = "Main"
    static private let stoardBoardForUiComponentsOne = "UiComponents"
    static private let stoardBoardForUiComponentsTwo = "UiComponents2"
    static private let stoardBoardForReverseKT = "ReverseKT"
    static private let stoaryBoardForCustomControls = "CustomControls"
    static private let stoaryBoardForCoreData = "CoreData"
    
    static func getAllData() -> [CombineScreenData] {
        
        return [
            CombineScreenData(storyBoardName: CombineScreenData.stoaryBoardForCoreData, vcName: "CoreDataViewController", title: "CoreData"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsOne, vcName: "UILabelViewController", title: "UILabelViewController"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsOne, vcName: "UIButtonViewController", title: "UIButtonViewController"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsOne, vcName: "UiTextFieldViewController", title: "UITexField Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsOne, vcName: "UITextViewViewController", title: "UITextView Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsOne, vcName: "UISwitchViewController", title: "UISwitch Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsOne, vcName: "UISliderViewController", title: "UiSlider Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsOne, vcName: "UIProgressBarViewController", title: "UIProgressView Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsOne, vcName: "UISegmentViewController", title: "UISegmentView Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsOne, vcName: "UIPageControlViewController", title: "UIPageControl Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsOne, vcName: "UIStepperViewController", title: "UIStepper Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.autoLayoutStoryBoardName, vcName: "UIScrollViewViewController", title: "UIScrollViewViewController"),
            CombineScreenData(storyBoardName: CombineScreenData.autoLayoutStoryBoardName, vcName: "UIScrollViewHorizontal", title: "UIScrollViewHorizontal"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsOne, vcName: "UITableContentViewController", title: "UITableview Demo 1"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsOne, vcName: "UiTableMovieViewController", title: "UITableView Movie List Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsOne, vcName: "UITableAnimalViewController", title: "UITableView Animal List Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsOne, vcName: "TableViewColorFruitsController", title: "UITableView Statemanagement Demo & Pull to Refresh "),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsOne, vcName: "TableViewExpandedController", title: "UITableView Expand and Collapse Text"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsTwo, vcName: "UICollectionViewController", title: "UICollectionView Grid Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsTwo, vcName: "SecondViewController", title: "UICollection View Demo Pull to refresh"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsTwo, vcName: "SeriesCollectionViewController", title: "UISearchBar demo CollectionView"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsTwo, vcName: "UIJobCollectionViewController", title: "UICollection Job Demo Screen"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsTwo, vcName: "UiImagePickerViewController", title: "UIImagePicker Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsTwo, vcName: "PHPickerImageController", title: "PHPicker Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsTwo, vcName: "UIActivityIndicatorViewController", title: "UIActivityIndicator Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsTwo, vcName: "UIActivityIndicatorViewController", title: "UIActivityIndicator Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsTwo, vcName: "WKWebViewViewController", title: "WKWebView and Toolbar, Barbutton Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsTwo, vcName: "UIStackViewDemoOne", title: "UIStackView Demo 1"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsTwo, vcName: "UIStackViewViewController", title: "UIStackView Demo 2"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsTwo, vcName: "StackViewDemoScreen", title: "StackView Demo Screen"),
          
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsTwo, vcName: "DemoPickerViewViewController", title: "Picker Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForUiComponentsTwo, vcName: "TabViewController", title: "Tabbar and MKMapView Demo"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForReverseKT, vcName: "GolfHomeViewController", title: "Reverse KT Golf Home Screen"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForReverseKT, vcName: "OTPViewController", title: "ReverseKT OTP Screen"),
            CombineScreenData(storyBoardName: CombineScreenData.stoardBoardForReverseKT, vcName: "TabbarDemoReverseKT", title: "ReverseKT Auto Resize TextView and Tabbar"),
            CombineScreenData(storyBoardName: CombineScreenData.stoaryBoardForCustomControls, vcName: "CustomControlViewController", title: "CustomControls"),
            
        ]
    }
}

class UICombineViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tblView: UITableView!
    
    
    //MARK: - Variable
    var getAllScreenData = CombineScreenData.getAllData()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        print(UpdateUserDetails.updateUserDetails.getUserName())
        tblView.delegate = self
        tblView.dataSource = self
        tblView.isEditing = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(btnClick))
    }
    
    @objc func btnClick(sender: UIBarButtonItem) {
        tblView.isEditing.toggle()
        sender.title = tblView.isEditing ? "Done" : "Edit"
    }
    

}

extension UICombineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        getAllScreenData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CombineScreenTableViewCell") as? CombineScreenTableViewCell else {
            return UITableViewCell()
        }
        
        cell.confiureCell(data: getAllScreenData[indexPath.row].title)
        return cell
    }
}

extension UICombineViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = getAllScreenData[sourceIndexPath.row]
        getAllScreenData.remove(at: sourceIndexPath.row)
        getAllScreenData.insert(item, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = UIStoryboard(name: getAllScreenData[indexPath.row].storyBoardName, bundle: nil).instantiateViewController(withIdentifier: getAllScreenData[indexPath.row].vcName)
        viewController.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    

}

extension UICombineViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= 0 {
            print("Large")
            UIView.animate(withDuration: 0.8) {
                self.navigationItem.largeTitleDisplayMode = .always
            }
        } else {
            print("Small")
            UIView.animate(withDuration: 0.8) {
                self.navigationItem.largeTitleDisplayMode = .always
            }
        }
    }
}
