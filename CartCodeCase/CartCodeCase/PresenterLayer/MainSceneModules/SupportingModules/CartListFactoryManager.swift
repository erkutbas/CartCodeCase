//
//  CartListFactoryManager.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

class CartListFactoryManager {
    
    func createUseCase() -> CartListUseCase {
        return CartListUseCase(repository: CartOperationsRepository(remote: CartOperationsApiRemote(apiManager: APIManager.shared, serviceProvider: CartOperationService())))
    }
    
}
