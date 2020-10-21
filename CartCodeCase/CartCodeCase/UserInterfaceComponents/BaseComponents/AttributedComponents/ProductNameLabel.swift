//
//  ProductNameLabel.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import Foundation

class ProductNameLabel: BaseDynamicAttributedLabel<ProductNameLabelData> {
    
    override func loadData() {
        super.loadData()
        
        guard let data = returnData() else { return }
        
        attributedText = NSMutableAttributedString(string: "\(LocalizableManager.productName.value): \(data.name)", attributes: [.font : data.textFont!, .foregroundColor: data.textColor])
    }
    
}
