//
//  CartOperationsRepositoryInterface.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//

import Foundation

protocol CartOperationsRepositoryInterface {
    
    func getCartList(params: CartListRequest, completion: @escaping (Result<CartListResponse, ErrorResponse>) -> Void)
    
}
