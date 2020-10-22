//
//  ProductViewCellComponent.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import UIKit

class ProductViewCellComponent: GenericCollectionViewCell<GenericDataProtocol, ProductViewComponent> {
   
    override func setupView() {
        super.setupView()
        setViewConfigurations()
    }
    
    private func setViewConfigurations() {
        backgroundColor = .white
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 6
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 2
        contentView.layer.shadowOpacity = 0.4
        
    }
    
}
