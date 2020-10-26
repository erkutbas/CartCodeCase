//
//  ProductDetailServiceModule.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import Foundation

class ProductDetailServiceModule: ApiServiceProvider<ProductDetailRequest> {
    
    init(request: ProductDetailRequest) {
        super.init(method: .get, path: Paths.cartItemDetail(request).path)
    }

}
