//
//  ProductListController.swift
//  EcomStore-MVC
//
//  Created by Dylan Sewell on 2/4/21.
//

import Foundation
import UIKit

final class ProductListController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    // MARK: - Constants
    private let identifier = "ProductCellID"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRow: CGFloat = 2
    
    // MARK: - Properties
    private var sneaker1 = Product(name: "calvin", cost: 150, description: "calvin shoes", imageName: "calvin")
    private var sneaker2 = Product(name: "puma", cost: 200, description: "not yeezys", imageName: "puma")
    private var sneaker3 = Product(name: "nike", cost: 200, description: "joggers", imageName: "nike")
    private lazy var products = [sneaker1, sneaker2, sneaker3]
    
    // MARK: - Init
    init(layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .homeGray
        setupView()
    }
    
    func setupView() {
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: - Action Methods
    
    // MARK: - Collection View DataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView .dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? ProductCell else {
            return UICollectionViewCell()
        }
        let product = products[indexPath.row]
        cell.updateViewWith(product: product)
        cell.backgroundColor = .red
        return cell
    }
    
    // MARK: - Collection View Flow Layout Delegate
     func collectionView(_ collectionView: UICollectionView,
                         layout collectionViewLayout: UICollectionViewLayout,
                         sizeForItemAt indexPath: IndexPath) -> CGSize {
       let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
       let availableWidth = view.frame.width - paddingSpace
       let widthPerItem = availableWidth / itemsPerRow
       
       return CGSize(width: widthPerItem, height: widthPerItem)
     }
     
     func collectionView(_ collectionView: UICollectionView,
                         layout collectionViewLayout: UICollectionViewLayout,
                         insetForSectionAt section: Int) -> UIEdgeInsets {
       return sectionInsets
     }
     
     func collectionView(_ collectionView: UICollectionView,
                         layout collectionViewLayout: UICollectionViewLayout,
                         minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return sectionInsets.left
     }
    
    // MARK: - Helper Methods
}
