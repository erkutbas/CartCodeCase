//
//  ProductViewComponentData.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import UIKit

class ProductViewComponentData: GenericDataProtocol {
    
    private(set) var productId: String?
    private(set) var imageData: CustomImageViewComponentData?
    private(set) var productInfoData: ProductBottomInfoComponentData
    private(set) var imageHeight: CGFloat = 100
    private(set) var shadowOption: Bool = false
    
    init(productId: String?, imageData: CustomImageViewComponentData? = nil, productInfoData: ProductBottomInfoComponentData) {
        self.productId = productId
        self.imageData = imageData
        self.productInfoData = productInfoData
    }
    
    func setImageHeight(with value: CGFloat) -> Self {
        self.imageHeight = value
        return self
    }
    
    func setShadowOption(with value: Bool) -> Self {
        self.shadowOption = value
        return self
    }
    
    var itemId: String? {
        get {
            return productId
        }
    }
    
}
