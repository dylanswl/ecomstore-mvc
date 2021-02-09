//
//  HomeCoordinator.swift
//  EcomStore-MVC
//
//  Created by Dylan Sewell on 2/9/21.
//

import Foundation
import UIKit

class HomeCoordinator {
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    private var productListController: ProductListController = {
        let layout = UICollectionViewFlowLayout()
        let controller = ProductListController(layout: layout)
        return controller
    }()
    
    // MARK: - Initializers
    init() {
        navigationController = UINavigationController(rootViewController: productListController)
        navigationController.navigationBar.isHidden = true
        updateProductListViewWithProducts()
    }
    
    // MARK: - Helpers
    func updateProductListViewWithProducts() {
        let sneaker1 = Product(name: "calvin", cost: 150, description: "calvin shoes", imageName: "calvin")
        let sneaker2 = Product(name: "puma", cost: 200, description: "not yeezys", imageName: "puma")
        let sneaker3 = Product(name: "nike", cost: 200, description: "joggers", imageName: "nike")
        
        let products = [sneaker1, sneaker2, sneaker3]
        productListController.updateViewWith(products: products)
    }
}
