//
//  ProductDetailLabel.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import Foundation

class ProductDetailLabel: BaseDynamicAttributedLabel<ProductDetailLabelData> {
    
    override func loadData() {
        super.loadData()
        
        guard let data = returnData() else { return }
        
        attributedText = NSMutableAttributedString(string: "\(LocalizableManager.productDescription.value): \(data.description)", attributes: [.font : data.textFont!, .foregroundColor: data.textColor])
    }
    
}
