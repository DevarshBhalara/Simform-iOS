//
//  ViewModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 15/06/23.
//

import Foundation
class ProductViewModel {
    
    init() { }
    
    var delegate: GetProductCategory?
    
    func getCategory() {
        ApiManagerAF.shared.callAPI(urlString: ApiManagerAF.storeUrl+"products/categories", method: .get) {
            (result: Result<[String], Error>) in
            
            switch result {
            case .success(let category):
                self.delegate?.productsCategories(categories: category)
            case .failure(let error):
                print("Error \(error)")
            }
        
        }
    }
    
    func getAllProduct() {
        ApiManagerAF.shared.callAPI(urlString: ApiManagerAF.storeUrl+"products", method: .get) {
            (result: Result<[Product], Error>) in
            
            switch result {
            case .success(let products):
                self.delegate?.getAllProducts(products: products)
            case .failure(let error):
                print("Error \(error)")
            }
        
        }
    }
}
