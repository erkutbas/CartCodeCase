//
//  CartOperationsCoreDataManagerInterface.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

protocol CartOperationsCoreDataManagerInterface {
    func saveToCoreData(cartList: Array<Product>)
    func saveImageIntoCoreData(data: ProductImageSaveRequest)
}
