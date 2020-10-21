//
//  CartOperationsApiRemoteInterface.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

protocol CartOperationsApiRemoteInterface {
    
    func getCartList(params: CartListRequest, completion: @escaping (Result<CartListResponse, ErrorResponse>) -> Void)
    
}
