//
//  UIButtonConfigViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 25/04/23.
//

import UIKit

class UIButtonConfigViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var btnProminent: UIButton!
    @IBOutlet weak var btnBordered: UIButton!
    @IBOutlet weak var btnBorderless: UIButton!
    @IBOutlet weak var btnFilled: UIButton!
    @IBOutlet weak var btnTinted: UIButton!
    @IBOutlet weak var btnGray: UIButton!
    @IBOutlet weak var btnPlain: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        btnPlain.configuration = UIButton.Configuration.plain()
        btnPlain.backgroundColor = .black
        btnPlain.setTitle("Plain", for: .normal)
        
        btnGray.configuration = UIButton.Configuration.gray()
        btnGray.setTitle("Gray", for: .normal)
        
        btnTinted.configuration = UIButton.Configuration.tinted()
        btnTinted.tintColor = .orange
        btnTinted.setTitle("tinted", for: .normal)
        
        btnFilled.configuration = UIButton.Configuration.filled()
        btnFilled.setTitle("Filled", for: .normal)
        
        btnBorderless.configuration = UIButton.Configuration.borderless()
        btnBorderless.backgroundColor = .orange
        btnBorderless.setTitle("Borderless", for: .normal)
        btnBorderless.configuration?.titleAlignment = UIButton.Configuration.TitleAlignment.leading
        
        
        btnBordered.configuration = UIButton.Configuration.bordered()
        btnBordered.backgroundColor = .blue
        btnBordered.setTitle("Bordered", for: .normal)
        btnBordered.configuration?.subtitle = "Hello"
        btnBordered.configuration?.indicator = UIButton.Configuration.Indicator.popup
        

        btnProminent.configuration = UIButton.Configuration.borderedProminent()
        btnProminent.configuration?.buttonSize = UIButton.Configuration.Size.small
        btnProminent.setTitle("Border prominent", for: .normal)
    }

}
