//
//  CartOperationsApiRemote.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

class CartOperationsApiRemote: CartOperationsApiRemoteInterface {
    
    private let apiManager: APIManagerInterface!
    private let serviceProvider: CartOperationService!
    
    public init(apiManager: APIManagerInterface, serviceProvider: CartOperationService) {
        self.apiManager = apiManager
        self.serviceProvider = serviceProvider
    }
    
    func getCartList(params: CartListRequest, completion: @escaping (Result<CartListResponse, ErrorResponse>) -> Void) {
        
        do {
            let request = try serviceProvider.getCartListServiceModule(request: params).returnUrlRequest()
            apiManager.executeRequest(urlRequest: request, completion: completion)
        } catch let error {
            print("error : \(error)")
        }
        
    }

}
