//
//  CartListSaveUseCase.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

class CartListSaveUseCase: CompletableUseCase<Array<Product>> {
    
    private let repository: CartOperationsRepositoryInterface!
    
    public init(repository: CartOperationsRepositoryInterface) {
        self.repository = repository
    }
    
    override func generateUseCase(parameter: Array<Product>, completion: @escaping (Result<Completed, ErrorResponse>) -> Void) {
        repository.saveToCoreData(cartList: parameter)
    }
    
}
