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
    private var products: [Product]? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
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
        guard let products = products else {
            return 0
        }
        return products.count
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView .dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? ProductCell, let products = products else {
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
    func updateViewWith(products: [Product]) {
        self.products = products
    }
}
