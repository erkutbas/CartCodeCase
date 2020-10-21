//
//  CartListServiceModule.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

class CartListServiceModule: ApiServiceProvider<CartListRequest> {
    
    init(request: CartListRequest) {
        super.init(method: .get, path: Paths.cartList.path)
    }

}
