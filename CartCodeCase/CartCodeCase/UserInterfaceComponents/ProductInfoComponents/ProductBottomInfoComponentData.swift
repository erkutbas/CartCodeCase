//
//  ProductBottomInfoComponentData.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import Foundation

class ProductBottomInfoComponentData {

    private(set) var productNameData: ProductNameLabelData
    private(set) var productPriceData: PriceInfoLabelData
    
    init(productNameData: ProductNameLabelData, productPriceData: PriceInfoLabelData) {
        self.productNameData = productNameData
        self.productPriceData = productPriceData
    }
    
}
