//
//  CartOperationsRepository.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//

import Foundation

class CartOperationsRepository: CartOperationsRepositoryInterface {

    private let remote = CartOperationsApiRemote()
    
    func getCartList(params: CartListRequest, completion: @escaping (Result<CartListResponse, ErrorResponse>) -> Void) {
        remote.getCartList(params: params, completion: completion)
    }
    
    deinit {
        print("DEINIT CartOperationsRepository")
    }

}
