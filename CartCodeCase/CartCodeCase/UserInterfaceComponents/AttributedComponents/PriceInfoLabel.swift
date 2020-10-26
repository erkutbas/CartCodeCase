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
        
        var attributedString = NSMutableAttributedString()
        
        attributedString = NSMutableAttributedString(string: "\(LocalizableManager.productPrice.value): ", attributes: [.font : data.textFont[0], .foregroundColor: data.textColor[0]])
        attributedString.append(NSMutableAttributedString(string:  "\(data.price)", attributes: [.font : data.textFont[1], .foregroundColor: data.textColor[1]]))
        
        attributedText = attributedString
    }
    
}
