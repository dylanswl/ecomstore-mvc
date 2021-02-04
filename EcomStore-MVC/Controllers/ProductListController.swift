//
//  ProductListController.swift
//  EcomStore-MVC
//
//  Created by Dylan Sewell on 2/4/21.
//

import Foundation
import UIKit

class ProductListController: UIViewController {
    // MARK: - Constants
    
    // MARK: - Properties
    private var sneaker1 = Product(name: "calvin", cost: 150, description: "calvin shoes")
    private var sneaker2 = Product(name: "puma", cost: 200, description: "not yeezys")
    private var sneaker3 = Product(name: "nike", cost: 200, description: "joggers")
    private lazy var products = [sneaker1, sneaker2, sneaker3]
    
    // MARK: - Controller Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .homeGray
        print(products)
    }
    
    // MARK: - Action Methods
    
    // MARK: - Helper Methods
}
