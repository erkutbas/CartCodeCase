//
//  CartOperationsFactoryManager.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

class CartOperationsFactoryManager {
    
    private lazy var apiRemote = CartOperationsApiRemote(apiManager: APIManager.shared, serviceProvider: CartOperationService())
    private lazy var repository = CartOperationsRepository(remote: apiRemote, coreData: CartOperationsCoreDataManager(coreDataManager: CoreDataManager.shared))
    
    func createCartListUseCase() -> CartListUseCase {
        return CartListUseCase(repository: repository)
    }
    
    func createCartListSaveUseCase() -> CartListSaveUseCase {
        return CartListSaveUseCase(repository: repository)
    }
    
    func createProductDetailUseCase() -> ProductDetailUseCase {
        return ProductDetailUseCase(repository: repository)
    }
}
