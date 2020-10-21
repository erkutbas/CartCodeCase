//
//  LocalizableManager.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import Foundation

enum LocalizableManager: GenericValueProtocol {

    typealias Value = String
    
    case productName
    case productPrice
    case productDescription
    
    var value: String {
        switch self {
        case .productName:
            return "productName".toLocalize()
        case .productPrice:
            return "productPrice".toLocalize()
        case .productDescription:
            return "productDescription".toLocalize()
        }
    }

}
