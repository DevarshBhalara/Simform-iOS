//
//  PHPickerImageViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 18/04/23.
//

import UIKit
import PhotosUI

class PHPickerImageController: UIViewController {

    
    var imageArray = [UIImage]()
    
    //MARK: - Outlets
    @IBOutlet private weak var btnImagePicker: UIButton!
    @IBOutlet private weak var photoCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pickImage(_ sender: UIButton) {
    
        var config = PHPickerConfiguration()
        config.selectionLimit = 4
        config.filter = .videos
        
        let phController = PHPickerViewController(configuration: config)
        phController.delegate = self
        self.present(phController, animated: true)
    }
    
}

extension PHPickerImageController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        print("Cell for item \(indexPath.row): \(imageArray[indexPath.row])")
        imageCell.configureCell(data: imageArray[indexPath.row])
        return imageCell
        
    }
    
    
}

extension PHPickerImageController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.size.width / 3 - 20, height: collectionView.frame.size.height / 5 - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}



extension PHPickerImageController: PHPickerViewControllerDelegate {

    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { [self]
                object, error in
                if let image = object as? UIImage {
                    print("If let image : \(image)")
                    imageArray.append(image)
                    print("After appending : \(imageArray)")
                }
                
                DispatchQueue.main.async {
                    self.photoCollectionView.reloadData()
                }
            }
        }
        
        print("picking finish")
        dismiss(animated: true)

    }
    
}
