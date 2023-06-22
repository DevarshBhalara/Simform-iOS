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
    func getProductError(error: String)
}

class ProductViewController: UIViewController {
    
    //MARK: Outlet
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var productCollectionView: UICollectionView!
    @IBOutlet private weak var catogoryCollectionView: UICollectionView!
    
    
    //MARK: - variable
    var products: [Product] = []
    var allProducts: [Product] = []
    var categories: [String] = []
    var viewModel = ProductViewModel()
    var searchTimer: Timer?
    
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
        searchBar.delegate = self
    }
    
    ///Show alert Dialog method
    private func showAlertDialog(message: String) {
        let alert = UIAlertController(title: "AppName", message: "Error occurred Please try again! \(message)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
}

//MARK: - Category protocol
extension ProductViewController: GetProductCategory {
    func getProductError(error: String) {
        showAlertDialog(message: error)
    }
    
    func productsCategories(categories: [String]) {
        self.categories = categories
        DispatchQueue.main.async { [weak self] in
            self?.catogoryCollectionView.reloadData()
        }
    
    }
    
    func getAllProducts(products: [Product]) {
        self.products = products
        self.allProducts = products
        DispatchQueue.main.async { [weak self] in
            self?.productCollectionView.reloadData()
        }
    }
    
    func getFilterProduct(filterProducts: [Product]) {
        self.products = filterProducts
        DispatchQueue.main.async { [weak self] in
            self?.productCollectionView.reloadData()
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
            guard let productViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController else {
                return
            }
            productViewController.product = products[indexPath.row].id
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

//MARK: Searchbar delegate
extension ProductViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.searchTimer?.invalidate()
        
        if searchText.isEmpty {
            products = self.allProducts
        } else {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { timer in
                DispatchQueue.main.async { [weak self] in
                    self?.products = self?.allProducts.filter { $0.title.contains(searchText) } ?? []
                    self?.productCollectionView.reloadData()
                }
            })
        }
    }
}
