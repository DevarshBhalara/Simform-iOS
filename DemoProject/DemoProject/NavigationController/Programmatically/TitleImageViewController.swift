//
//  TitleImageViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 05/05/23.
//

import UIKit

class TitleImageViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var btnClick: UIButton!
    @IBOutlet weak var btnGoToSecond: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        btnClick.tintAdjustmentMode = .normal
        btnGoToSecond.tintAdjustmentMode = .normal
        let view = UIView(frame: CGRect(x: view.center.x, y: view.center.y, width: 140, height: 50))
        let titleText = UILabel(frame: CGRect(x: 20, y: 0, width: 100, height: 40))
        titleText.text = "Home"
        titleText.textAlignment = .center
        view.addSubview(titleText)
        let imagView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let image = UIImage(systemName: "homekit")
        imagView.tintColor = .black
        imagView.image = image
        view.addSubview(imagView)
        self.navigationItem.titleView = view
        navigationController?.navigationBar.barTintColor = .red
    }

    @IBAction func btnPopClicked(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "PopUpTableView") else { return  }
        viewController.modalPresentationStyle = .popover
        viewController.preferredContentSize = CGSize(width: view.bounds.width / 2, height: 400)
        if let popover = viewController.popoverPresentationController {
            popover.sourceView = sender
        }
        navigationController?.present(viewController, animated: true)
    }
}

