//
//  DetailProductViewModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 21/06/23.
//

import Foundation
import UIKit
class DetailProductViewModel {
    
    weak var delegate: GetSignleProduct?
    
    func getProduct(productId: Int) {
        APIManagerDemo.shared.call(type: .getProduct(id: productId)) { [weak self]
            (result: Result<Product, CustomError>) in
            switch result {
            case .success(let product):
                self?.delegate?.getProduct(product: product)
            case .failure(let error):
                self?.delegate?.getProductError(error: error)
            }
        }
    }
    
    func getImage(imageUrl: String) {
        APIManagerDemo.shared.callLoadImage(url: imageUrl) { [weak self] (result: Result<UIImage, CustomError>) in
            switch result {
            case .success(let image):
                self?.delegate?.getProductImage(image: image)
            case .failure(let error):
                self?.delegate?.getProductError(error: error)
            }
        }
    }
}

//MARK: - Protocol get product
protocol GetSignleProduct: AnyObject{
    func getProduct(product: Product)
    func getProductError(error: CustomError)
    func getProductImage(image: UIImage)
}
