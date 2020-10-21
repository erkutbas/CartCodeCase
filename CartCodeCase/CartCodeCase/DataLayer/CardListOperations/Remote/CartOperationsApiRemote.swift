//
//  CartOperationsApiRemote.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

class CartOperationsApiRemote: CartOperationsApiRemoteInterface {
    
    func getCartList(params: CartListRequest, completion: @escaping (Result<CartListResponse, ErrorResponse>) -> Void) {
        
        let serviceProvider = CartOperationService()
        
        do {
            let request = try serviceProvider.getCartListServiceModule(request: params).returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: request, completion: completion)
        } catch let error {
            print("error : \(error)")
        }
        
    }

}
