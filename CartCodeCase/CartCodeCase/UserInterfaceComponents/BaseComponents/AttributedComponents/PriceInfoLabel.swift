//
//  PriceInfoLabel.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import Foundation

class PriceInfoLabel: BaseDynamicAttributedLabel<PriceInfoLabelData> {
    
    override func loadData() {
        super.loadData()
        
        guard let data = returnData() else { return }
        
        attributedText = NSMutableAttributedString(string: "\(LocalizableManager.productPrice.value): \(data.price)", attributes: [.font : data.textFont!, .foregroundColor: data.textColor])
    }
    
}
