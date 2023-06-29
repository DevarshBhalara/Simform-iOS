//
//  ViewModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 15/06/23.
//

import Foundation
import Alamofire

class ProductViewModel {
    
    var delegate: GetProductCategory?
    
    func getCategory() {
        ApiManagerAF.shared.callAPI(urlString: ApiManagerAF.shared.storeUrl+"products/categories", method: .get) { [weak self]
            (result: Result<[String], Error>) in
            
            switch result {
            case .success(let category):
                self?.delegate?.productsCategories(categories: category)
            case .failure(let error):
                print("Error \(error)")
            }
        
        }
    }
    
    func getAllProduct() {
        ApiManagerAF.shared.callAPI(urlString: ApiManagerAF.shared.storeUrl+"products", method: .get) { [weak self]
            (result: Result<[Product], Error>) in
            
            switch result {
            case .success(let products):
                self?.delegate?.getAllProducts(products: products)
            case .failure(let error):
                self?.delegate?.getProductError(error: error.localizedDescription)
            }
        
        }
    }
    
    func filterProduct(category: String) {
        let encodeParameter = category.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "NA"
        print("URl \(ApiManagerAF.shared.storeUrl+"products/"+encodeParameter)")
        ApiManagerAF.shared.callAPI(urlString: ApiManagerAF.shared.storeUrl+"products/category/"+encodeParameter, method: .get) { [weak self]
            (result: Result<[Product], Error>) in
            
            switch result {
            case .success(let products):
                self?.delegate?.getAllProducts(products: products)
            case .failure(let error):
                print("Error \(error)")
            }
        
        }
    }
}
