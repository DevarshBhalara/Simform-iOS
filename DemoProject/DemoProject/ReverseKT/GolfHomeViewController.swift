//
//  GolfHomeViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 26/04/23.
//

import UIKit

class GolfHomeViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var segmentGame: UISegmentedControl!
    @IBOutlet weak var buttonGameOver: UIButton!
    @IBOutlet weak var potCountView: UIView!
    @IBOutlet weak var labelPotCointCount: UILabel!
    @IBOutlet weak var potImage: UIImageView!
    @IBOutlet weak var cardCollectionView: UICollectionView!
    @IBOutlet weak var buttonUpdateScore: UIButton!
    @IBOutlet weak var tableHeader: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var whiteColorView: UIView!
    @IBOutlet weak var cardsEarnedStackView: UIStackView!
    @IBOutlet weak var buttonSkins: UIButton!
    @IBOutlet weak var buttonCloseToPin: UIButton!
    @IBOutlet weak var buttonGolfPocker: UIButton!
    
    //MARK: - Variables
    let potCointCount = 120
    let baseCardCount = 5
    let totalCardCount = 10
    var groupedPlayerData = GroupStructureModel.getAllPlayerData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
        /** Background image opacity  */
        whiteColorView.alpha = 0.5
        
        /** Setting table view header  **/
        tableHeader.frame = CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 500)
        tableHeader.frame.origin.y = 0
        tableView.tableHeaderView = tableHeader
        
        /** Update score  button  */
        buttonUpdateScore.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        buttonUpdateScore.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        buttonUpdateScore.layer.shadowOpacity = 1.0
        buttonUpdateScore.layer.shadowRadius = 0.0
        buttonUpdateScore.layer.masksToBounds = false
        buttonUpdateScore.layer.cornerRadius = 4.0
        
        /** Pot count view background  */
        potCountView.backgroundColor = UIColor(white: 1, alpha: 0.1)
        potCountView.layer.cornerRadius = 15
        
        /** Game over button shadow */
        buttonGameOver.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        buttonGameOver.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        buttonGameOver.layer.shadowOpacity = 1.0
        buttonGameOver.layer.shadowRadius = 0.0
        buttonGameOver.layer.masksToBounds = false
        buttonGameOver.layer.cornerRadius = 4.0
        
        getPotImage()
        configurePotViewGameoverButton()
        
        /** Collection view delegate  */
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        
        /**Table view delegate**/
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "GroupTableViewCell", bundle: nil), forCellReuseIdentifier: "GroupTableViewCell")
        tableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
        tableView.backgroundColor = UIColor(white: 1, alpha: 0)
        
        if totalCardCount == 0 {
            cardsEarnedStackView.isHidden = true
        }
        
        /** Game buttons */
        buttonGolfPocker.layer.borderWidth = 2
        buttonGolfPocker.layer.cornerRadius = 10
        buttonGolfPocker.layer.borderColor = CGColor(red: 0, green: 180, blue: 0, alpha: 1)
        
        buttonCloseToPin.alpha = 0.4
        buttonSkins.alpha = 0.4
        
    }
    
   
    @IBAction func buttonGoldPockerClicked(_ sender: UIButton) {

        sender.alpha = 1
        sender.layer.borderWidth = 2
        sender.layer.cornerRadius = 10
        sender.layer.borderColor = CGColor(red: 0, green: 180, blue: 0, alpha: 1)
        
        buttonCloseToPin.alpha = 0.4
        buttonSkins.alpha = 0.4
        buttonSkins.layer.borderWidth = 0
        buttonCloseToPin.layer.borderWidth = 0
    }
    
    @IBAction func buttonCloseToPinClicked(_ sender: UIButton) {

        sender.alpha = 1
        sender.layer.borderWidth = 2
        sender.layer.cornerRadius = 10
        sender.layer.borderColor = CGColor(red: 0, green: 180, blue: 0, alpha: 1)
        
        buttonGolfPocker.alpha = 0.4
        buttonGolfPocker.layer.borderWidth = 0
        buttonSkins.alpha = 0.4
        buttonSkins.layer.borderWidth = 0
        
    }
    
    @IBAction func buttonSkinsClicked(_ sender: UIButton) {
        sender.alpha = 1
        sender.layer.borderWidth = 2
        sender.layer.cornerRadius = 10
        sender.layer.borderColor = CGColor(red: 0, green: 180, blue: 0, alpha: 1)
        
        buttonGolfPocker.alpha = 0.4
        buttonCloseToPin.alpha = 0.4
        buttonGolfPocker.layer.borderWidth = 0
        buttonCloseToPin.layer.borderWidth = 0
        
        
    }
    
    
    @IBAction func segmentGameChanged(_ sender: UISegmentedControl) {
        
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
        
        if sender.isSelected {
            conguration?.subtitle = ""
        } else {
            conguration?.subtitle =  "Let's see who won"
        }
        sender.configuration = conguration
        
        
    }
    
    
    private func getPotImage() {
        
        if potCointCount == 0 {
            labelPotCointCount.text = "$\(potCointCount)"
            potImage.image = UIImage(named: "emptyPot")
        } else if potCointCount <= 100 {
            labelPotCointCount.text = "$\(potCointCount)"
            potImage.image = UIImage(named: "halfFill")
        } else if potCointCount > 100 {
            labelPotCointCount.text = "$\(potCointCount)"
            potImage.image = UIImage(named: "group4")
        }
    }

}

//MARK: - Collection view Datasource
extension GolfHomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if totalCardCount > 5 {
            return 6
        } else {
            return totalCardCount
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as? CardCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(currentRow: indexPath.row, count: totalCardCount - baseCardCount)
        return cell

    }
    
    
}

//MARK: - Collection view delegate
extension GolfHomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 30, height: 30)
        
    }
    
}

extension GolfHomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        groupedPlayerData.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groupedPlayerData[section].playerData.count + 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as? HeaderTableViewCell else {
                return UITableViewCell()
            }
            cell.configureCell(data: groupedPlayerData[indexPath.section], sectionNumber: indexPath.section)
            
            cell.chatButtonClickedClosure  = { isSelected in

                self.groupedPlayerData[indexPath.section].isSectionIconClick?.toggle()
                
                for i in 0...self.groupedPlayerData[indexPath.section].playerData.count - 1  {

                    if self.groupedPlayerData[indexPath.section].playerData[i].isChatVisible {
                        
                        self.groupedPlayerData[indexPath.section].playerData[i].isChatClicked?.toggle()
                    }
                }
                tableView.reloadSections([indexPath.section], with: .automatic)
            }
            
            return cell
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell", for: indexPath) as? GroupTableViewCell else {
                return UITableViewCell()
            }
            
            cell.changeButton = {
                self.groupedPlayerData[indexPath.section].playerData[indexPath.row - 1].isChatClicked?.toggle()
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
            
            cell.configureCell(data: groupedPlayerData[indexPath.section].playerData[indexPath.row - 1], row: indexPath.row)
            return cell
        }
    }
    
}

extension GolfHomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}


