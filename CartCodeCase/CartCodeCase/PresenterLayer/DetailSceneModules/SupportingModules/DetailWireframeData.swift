//
//  DetailWireframeData.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import Foundation

class DetailWireframeData: WireframeDataProtocol {
    
    private(set) var productData: ProductViewComponentData
    
    init(productData: ProductViewComponentData) {
        self.productData = productData
    }
    
}
