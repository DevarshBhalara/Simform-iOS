//
//  SongTableViewCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 26/04/23.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    let songDetail = SongStructureModel.getAllSong()
    var section: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "SongCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SongCollectionCell")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension SongTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        songDetail[self.section].songData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SongCollectionCell", for: indexPath) as? SongCollectionViewCell else { return UICollectionViewCell()
        }
        
        cell.lblName.text = songDetail[section].songData[indexPath.row].albumName
        cell.albumImage.image = UIImage(named: songDetail[section].songData[indexPath.row].image)
        return cell
        }
}

extension SongTableViewCell: UICollectionViewDelegate {
    
}

extension SongTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.frame.size.width / 2 - 20 , height: 200)
    }
}

