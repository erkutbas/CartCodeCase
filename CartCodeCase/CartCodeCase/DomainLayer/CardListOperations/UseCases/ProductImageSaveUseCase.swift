//
//  ProductImageSaveUseCase.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import Foundation

class ProductImageSaveUseCase: CompletableUseCase<ProductImageSaveRequest> {
    
    private let repository: CartOperationsRepositoryInterface!
    
    public init(repository: CartOperationsRepositoryInterface) {
        self.repository = repository
    }
    
    override func generateUseCase(parameter: ProductImageSaveRequest, completion: @escaping (Result<Completed, ErrorResponse>) -> Void) {
//        repository.saveImageIntoCoreData(data: parameter)
    }
    
}
