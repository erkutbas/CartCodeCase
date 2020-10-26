//
//  ProductDetailUseCase.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import Foundation

class ProductDetailUseCase: SingleResponseUseCase<ProductDetailRequest, ProductDetailResponse> {
    
    private let repository: CartOperationsRepositoryInterface!
    
    public init(repository: CartOperationsRepositoryInterface) {
        self.repository = repository
    }
    
    override func generateUseCase(parameter: ProductDetailRequest, completion: @escaping (Result<ProductDetailResponse, ErrorResponse>) -> Void) {
        repository.getProductDetail(params: parameter, completion: completion)
    }
}
