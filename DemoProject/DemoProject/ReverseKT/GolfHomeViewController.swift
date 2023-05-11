//
//  GolfHomeViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 26/04/23.
//

import UIKit

class GolfHomeViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet private weak var stackViewGameSelection: UIStackView!
    @IBOutlet private weak var buttonGameOver: UIButton!
    @IBOutlet private weak var potCountView: UIView!
    @IBOutlet private weak var labelPotCointCount: UILabel!
    @IBOutlet private weak var potImage: UIImageView!
    @IBOutlet private weak var cardCollectionView: UICollectionView!
    @IBOutlet private weak var buttonUpdateScore: UIButton!
    @IBOutlet private weak var tableHeader: UIView!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var whiteColorView: UIView!
    @IBOutlet private weak var cardsEarnedStackView: UIStackView!
    @IBOutlet private weak var buttonSkins: UIButton!
    @IBOutlet private weak var buttonCloseToPin: UIButton!
    @IBOutlet private weak var viewContainer: UIView!
    @IBOutlet private weak var buttonGolfPocker: UIButton!
    
    //MARK: - Variables
    let potCointCount = 110
    let baseCardCount = 5
    let totalCardCount = 8
    var groupedPlayerData = GroupStructureModel.getAllPlayerData()
    let selectionButtonAlpha = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        stackViewGameSelection.layer.cornerRadius = 10
        stackViewGameSelection.backgroundColor = UIColor(white: 1, alpha: 0.1)
    }
    
    private func setupUI() {
        setBackgroundOpacity()
        buttonShadowConfiguration(button: buttonUpdateScore)
        potViewBackground()
        buttonShadowConfiguration(button: buttonGameOver)
        getPotImage()
        configurePotViewGameoverButton()
        delegateRegisterCells()
        gameSelectionButtonConfiguration()
        hideCardIfCountZero()
    }
    
    private func setBackgroundOpacity() {
        whiteColorView.alpha = 0.5
        viewContainer.backgroundColor = .clear
        stackViewGameSelection.layer.cornerRadius = 10
    }
    
    private func buttonShadowConfiguration(button: UIButton) {
        button.layer.shadowColor = UIColor(named: "transparent25")?.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.0
        button.layer.cornerRadius = 4.0
    }
    
    private func potViewBackground() {
        potCountView.backgroundColor = UIColor(white: 1, alpha: 0.1)
        potCountView.layer.cornerRadius = 15
    }
     
    private func delegateRegisterCells() {
        
        /** Collection view delegate  */
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        
        /**Table view delegate, register and background color **/
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "GroupTableViewCell", bundle: nil), forCellReuseIdentifier: "GroupTableViewCell")
        tableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
        tableView.backgroundColor = UIColor(white: 1, alpha: 0)
    }
    
    private func gameSelectionButtonConfiguration() {
        buttonGolfPocker.layer.borderWidth = 2
        buttonGolfPocker.layer.cornerRadius = 10
        buttonGolfPocker.layer.borderColor = UIColor(named: "gameSelectionBorder")?.cgColor
        buttonCloseToPin.alpha = selectionButtonAlpha
        buttonSkins.alpha = selectionButtonAlpha
    }
    
    private func hideCardIfCountZero() {
        if totalCardCount == 0 {
            cardsEarnedStackView.isHidden = true
            viewContainer.frame = CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: viewContainer.frame.size.height - 50)
        }
    }
    
    private func changeConfigurationButton(clickedButton: UIButton, button2: UIButton, button3: UIButton) {
        clickedButton.alpha = 1
        clickedButton.layer.borderWidth = 2
        clickedButton.layer.cornerRadius = 10
        clickedButton.layer.borderColor = UIColor(named: "gameSelectionBorder")?.cgColor
        
        if clickedButton == buttonGolfPocker {
            buttonCloseToPin.alpha = selectionButtonAlpha
            buttonSkins.alpha = selectionButtonAlpha
            buttonSkins.layer.borderWidth = 0
            buttonCloseToPin.layer.borderWidth = 0
        } else if clickedButton == buttonCloseToPin {
            buttonSkins.alpha = selectionButtonAlpha
            buttonGolfPocker.alpha = selectionButtonAlpha
            buttonGolfPocker.layer.borderWidth = 0
            buttonSkins.layer.borderWidth = 0
        } else {
            buttonGolfPocker.alpha = selectionButtonAlpha
            buttonCloseToPin.alpha = selectionButtonAlpha
            buttonGolfPocker.layer.borderWidth = 0
            buttonCloseToPin.layer.borderWidth = 0
        }
    }

    @IBAction func buttonGoldPockerClicked(_ sender: UIButton) {
        changeConfigurationButton(clickedButton: sender, button2: buttonCloseToPin, button3: buttonSkins)
    }
    
    @IBAction func buttonCloseToPinClicked(_ sender: UIButton) {
        changeConfigurationButton(clickedButton: sender, button2: buttonSkins, button3: buttonGolfPocker)
    }
    
    @IBAction func buttonSkinsClicked(_ sender: UIButton) {
        changeConfigurationButton(clickedButton: sender, button2: buttonCloseToPin, button3: buttonGolfPocker)
    }
    
    
    private func configurePotViewGameoverButton() {
        /** Normal state  */
        buttonGameOver.setTitle("Game over?", for:  .normal)
        buttonGameOver.setImage(UIImage(named: "crowns"), for: .normal)
        
        /**  Selected state */
        buttonGameOver.setTitle("View Game Summery", for:  .selected)
        buttonGameOver.setImage(UIImage(named: "playingCards"), for: .selected)
    }
    
    @IBAction func buttonGameOverToggle(_ sender: UIButton) {
        sender.isSelected.toggle()
        var conguration = sender.configuration
        conguration?.subtitle = sender.isSelected ? "" : "Let's see who won"
        sender.configuration = conguration
    }
    
    private func getPotImage() {
        labelPotCointCount.text = "$\(potCointCount)"
        if potCointCount == 0 {
            potImage.image = UIImage(named: "emptyPot")
        } else if potCointCount <= 100 {
            potImage.image = UIImage(named: "halfFill")
        } else if potCointCount > 100 {
            potImage.image = UIImage(named: "group4")
        }
    }
    
}

//MARK: - Collection view Datasource
extension GolfHomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalCardCount > 5 ? 6 : totalCardCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as? CardCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(currentRow: indexPath.row, count: totalCardCount - baseCardCount)
        return cell
    }
}

//MARK: - Collection view delegate flow layout
extension GolfHomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 30, height: 30)
    }
    
}

//MARK: - Table view Datasource
extension GolfHomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        groupedPlayerData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groupedPlayerData[section].playerData.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            print("for row at Section \(indexPath.section) Row \(indexPath.row)")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as? HeaderTableViewCell else {
                return UITableViewCell()
            }
            cell.configureCell(data: groupedPlayerData[indexPath.section], sectionNumber: indexPath.section)
            cell.chatButtonClickedClosure  = { [weak self] isSelected in
                self?.groupedPlayerData[indexPath.section].isSectionIconClick?.toggle()
                for i in 0...(self?.groupedPlayerData[indexPath.section].playerData.count ?? 1) - 1  {
                    if ((self?.groupedPlayerData[indexPath.section].playerData[i].isChatVisible) != nil) {
                        self?.groupedPlayerData[indexPath.section].playerData[i].isChatClicked = isSelected
                    }
                }
                tableView.reloadSections([indexPath.section], with: .none)
            }
            
            return cell
        } else if indexPath.row == 1 {
            print("for row at Section \(indexPath.section) Row \(indexPath.row)")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell", for: indexPath) as? GroupTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configureCell(data: nil, row: indexPath.row)
            return cell
        } else {
            print("for row at Section \(indexPath.section) Row \(indexPath.row)")
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell", for: indexPath) as? GroupTableViewCell else {
                return UITableViewCell()
            }
          
            cell.changeButton = {
                [weak self]
                isSelected in
                self?.groupedPlayerData[indexPath.section].playerData[indexPath.row - 2].isChatClicked?.toggle()
                let clickedItemcount = self?.groupedPlayerData[indexPath.section].playerData.filter { $0.isChatClicked == true }.count
                let totalItemCount = self?.groupedPlayerData[indexPath.section].playerData.filter { $0.isChatVisible == true }.count
                self?.groupedPlayerData[indexPath.section].isSectionIconClick =  clickedItemcount == totalItemCount
                tableView.reloadSections([indexPath.section], with: .none)
            }

            cell.configureCell(data: groupedPlayerData[indexPath.section].playerData[indexPath.row - 2] , row: indexPath.row)
            return cell
        }
    }
    
}

//MARK: - Tableview Delegate
extension GolfHomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //prinitng this to check for which cell this method is called
        print("Section \(indexPath.section) Row \(indexPath.row)")
    }
    
  
}


