//
//  CartOperationsRepository.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//

import Foundation

class CartOperationsRepository: CartOperationsRepositoryInterface {

    private let remote: CartOperationsApiRemoteInterface!
    private let coreData: CartOperationsCoreDataManagerInterface!
    
    public init(remote: CartOperationsApiRemoteInterface, coreData: CartOperationsCoreDataManagerInterface) {
        self.remote = remote
        self.coreData = coreData
    }
    
    func getCartList(params: CartListRequest, completion: @escaping (Result<CartListResponse, ErrorResponse>) -> Void) {
        remote.getCartList(params: params, completion: completion)
    }
    
    func getProductDetail(params: ProductDetailRequest, completion: @escaping (Result<ProductDetailResponse, ErrorResponse>) -> Void) {
        remote.getProductDetail(params: params, completion: completion)
    }
    
    func saveToCoreData(cartList: Array<Product>) {
        coreData.saveToCoreData(cartList: cartList)
    }
    
    deinit {
        print("DEINIT CartOperationsRepository")
    }

}
