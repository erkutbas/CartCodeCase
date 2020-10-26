//
//  ProductDetailRequest.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import Foundation

class ProductDetailRequest: CodableDataProtocol {
    
    private(set) var productId: String
    
    init(productId: String) {
        self.productId = productId
    }
    
    enum CodingKeys: String, CodingKey {
        case productId = "product_id"
    }
    
}
