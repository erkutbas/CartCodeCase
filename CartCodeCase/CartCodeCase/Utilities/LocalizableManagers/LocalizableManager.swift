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
    case productDescriptionDoesNotExist
    case productNameDoesNotExist
    case networkError
    
    var value: String {
        switch self {
        case .productName:
            return "productName".toLocalize()
        case .productPrice:
            return "productPrice".toLocalize()
        case .productDescription:
            return "productDescription".toLocalize()
        case .productDescriptionDoesNotExist:
            return "productDescriptionDoesNotExist".toLocalize()
        case .productNameDoesNotExist:
            return "productNameDoesNotExist".toLocalize()
        case .networkError:
            return "networkError".toLocalize()
        }
    }

}
