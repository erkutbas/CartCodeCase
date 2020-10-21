//
//  ConstantEndpoints.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

typealias Paths = ConstantEndpoints.Paths

struct ConstantEndpoints {
    
    // MARK: - BaseUrls according to environments -
    struct BaseUrls {
        static let developmentBaseEndpointUrl = "https://s3-eu-west-1.amazonaws.com/developer-application-test/"
        static let testBaseEndpointUrl = "https://s3-eu-west-1.amazonaws.com/developer-application-test/"
        static let qualityAssuranceBaseEndpointUrl = "https://s3-eu-west-1.amazonaws.com/developer-application-test/"
    }
    
    // MARK: - Paths ... -
    enum Paths {
        case cartList
        case cartItemDetail
        
        /*
         
         other paths....
         
         */
        
        // MARK: - Endpoint Paths -
        var path: String {
            switch self {

            case .cartList:
                return "cart/list"
            case .cartItemDetail:
                return "cart/list"
            }
        }
    }
    
}
