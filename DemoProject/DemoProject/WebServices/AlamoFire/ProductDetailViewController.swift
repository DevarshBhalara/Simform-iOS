//
//  ProductDetailViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 15/06/23.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var lblDescription: UILabel!
    @IBOutlet private weak var lblRating: UILabel!
    @IBOutlet private weak var lblPrice: UILabel!
    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var imgProduct: UIImageView!
    
    //MARK: - Variables
    var product: Int?
    private var viewModel = DetailProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        loadingIndicator.startAnimating()
        viewModel.delegate = self
        if let product = product {
            viewModel.getProduct(productId: product)
        }
    }
    
    private func setData(product: Product) {
        viewModel.getImage(imageUrl: product.image)
        lblName.text = product.title
        lblDescription.text = product.description
        lblPrice.text = "$\(product.price)"
        lblRating.text = "\(product.rating.rate)"
    }
    
    //Show dialog for error
    private func showAlertDialog(message: String) {
        let alert = UIAlertController(title: "Error Occurred", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
}

//MARK: - Get Product delegate
extension ProductDetailViewController: GetSignleProduct {
    func getProductImage(image: UIImage) {
        DispatchQueue.main.async { [weak self] in
            self?.imgProduct.image = image
            self?.loadingIndicator.stopAnimating()
        }
    }
    
    func getProduct(product: Product) {
        setData(product: product)
    }
    
    func getProductError(error: CustomError) {
        showAlertDialog(message: error.body)
    }
    
}
