//
//  CartOperationService.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

class CartOperationService {
    
    func getCartListServiceModule(request: CartListRequest) -> CartListServiceModule {
        return CartListServiceModule(request: request)
    }
    
}
