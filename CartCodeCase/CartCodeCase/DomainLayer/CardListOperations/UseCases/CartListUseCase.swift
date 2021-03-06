//
//  CartListUseCase.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//

import Foundation

class CartListUseCase: SingleResponseUseCase<CartListRequest, CartListResponse> {
    
    private let repository: CartOperationsRepositoryInterface!
    
    public init(repository: CartOperationsRepositoryInterface) {
        self.repository = repository
    }
    
    override func generateUseCase(parameter: CartListRequest, completion: @escaping (Result<CartListResponse, ErrorResponse>) -> Void) {
        repository.getCartList(params: parameter, completion: completion)
    }
    
}
