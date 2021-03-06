//
//  ProductNameLabelData.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import UIKit

class ProductNameLabelData {
    private(set) var name: String
    private(set) var textColor: Array<UIColor> = [UIColor.black, UIColor.gray]
    private(set) var textFont: Array<UIFont?> = [MainFont.Bold(14).value, MainFont.SemiBold(14).value]
    private(set) var textAlignment: NSTextAlignment = .left
    
    init(name: String) {
        self.name = name
    }
    
    func setTextColor(with value: Array<UIColor>) -> Self {
        self.textColor = value
        return self
    }
    
    func setTextFont(with value: Array<UIFont?>) -> Self {
        self.textFont = value
        return self
    }
    
    func setTextAlignment(with value: NSTextAlignment) -> Self {
        self.textAlignment = value
        return self
    }
    
}
