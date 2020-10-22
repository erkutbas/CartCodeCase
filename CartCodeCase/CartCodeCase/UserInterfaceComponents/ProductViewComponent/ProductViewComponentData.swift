//
//  ProductViewComponentData.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import Foundation

class ProductViewComponentData: GenericDataProtocol {
    
    private(set) var productId: String?
    private(set) var imageData: CustomImageViewComponentData
    private(set) var productInfoData: ProductBottomInfoComponentData
    
    init(productId: String?, imageData: CustomImageViewComponentData, productInfoData: ProductBottomInfoComponentData) {
        self.productId = productId
        self.imageData = imageData
        self.productInfoData = productInfoData
    }
    
    var itemId: String? {
        get {
            return productId
        }
    }
    
}
