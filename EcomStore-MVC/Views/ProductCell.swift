//
//  ProductCell.swift
//  EcomStore-MVC
//
//  Created by Dylan Sewell on 2/4/21.
//

import UIKit

class ProductCell: UICollectionViewCell {
    // MARK: Constants
    
    // MARK: Properties
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UI
    func setupView() {
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    func updateViewWith(product: Product) {
        imageView.image = UIImage(named: product.imageName)
    }
}
