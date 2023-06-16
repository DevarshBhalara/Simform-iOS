//
//  ProductViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 15/06/23.
//

import UIKit

protocol GetProductCategory {
    func productsCategories(categories: [String])
    func getAllProducts(products: [Product])
    func getFilterProduct(filterProducts: [Product])
}

class ProductViewController: UIViewController {
    
    //MARK: Outlet
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var catogoryCollectionView: UICollectionView!
    
    
    //MARK: - variable
    var products: [Product] = []
    var allProducts: [Product] = []
    var categories: [String] = []
    var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
        
    private func setUpUI() {
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        catogoryCollectionView.dataSource = self
        catogoryCollectionView.delegate = self
        viewModel.delegate = self
        catogoryCollectionView.allowsMultipleSelection = false
        viewModel.getCategory()
        viewModel.getAllProduct()
        
        
    }


}

//MARK: - Category protocol
extension ProductViewController: GetProductCategory {
    func productsCategories(categories: [String]) {
        self.categories = categories
        DispatchQueue.main.async {
            self.catogoryCollectionView.reloadData()
        }
        
    }
    
    func getAllProducts(products: [Product]) {
        self.products = products
        self.allProducts = products
        DispatchQueue.main.async {
            self.productCollectionView.reloadData()
        }
    }
    
    func getFilterProduct(filterProducts: [Product]) {
        self.products = filterProducts
        DispatchQueue.main.async {
            self.productCollectionView.reloadData()
        }
    }
}

//MARK: - CollectionVIew Data Source
extension ProductViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == catogoryCollectionView ? categories.count : products.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == catogoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(name: categories[indexPath.row])
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductCell else {
                return UICollectionViewCell()
            }
            cell.configureProduct(product: products[indexPath.row])
            return cell
        }
        
    }
    
}

//MARK: Collection delegate
extension ProductViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == catogoryCollectionView {
            viewModel.filterProduct(category: categories[indexPath.row])
            
        } else {
            let productViewController = ProductDetailViewController()
            productViewController.product = products[indexPath.row]
            navigationController?.pushViewController(productViewController, animated: true)
        }
       
    }
}

//MARK: - Collection Flow layout
extension ProductViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.size.width / 2 - 15, height: collectionView.frame.size.height / 2)
    }
}
