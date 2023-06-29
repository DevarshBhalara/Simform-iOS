//
//  ProductCell.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 15/06/23.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    func configureProduct(product: Product) {
        self.layer.cornerRadius = 10
        if let url = URL(string: product.image) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let imageData = data else { return }
                DispatchQueue.main.async {
                    self.imgProduct.image = UIImage(data: imageData)
                }
            }.resume()
        }
        lblPrice.text = "$\(String(product.price))"
        lblTitle.text = product.title
        
    }
    
}
