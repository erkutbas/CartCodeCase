//
//  ProductNameLabelData.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import UIKit

class ProductNameLabelData {
    private(set) var name: String
    private(set) var textColor: UIColor = UIColor.gray
    private(set) var textFont: UIFont? = MainFont.Regular(12).value
    private(set) var textAlignment: NSTextAlignment = .left
    
    init(name: String) {
        self.name = name
    }
    
    func setTextColor(with value: UIColor) -> Self {
        self.textColor = value
        return self
    }
    
    func setTextFont(with value: UIFont?) -> Self {
        self.textFont = value
        return self
    }
    
    func setTextAlignment(with value: NSTextAlignment) -> Self {
        self.textAlignment = value
        return self
    }
    
}
