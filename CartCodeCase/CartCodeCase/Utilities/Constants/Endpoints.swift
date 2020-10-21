//
//  BaseEndPoints.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

class BaseEndPoints {
    
    private var baseUrl: String!
    
    private init() { }
    
    init(environment: Environments) {
        switch environment {
        case .development:
            baseUrl = ConstantEndpoints.BaseUrls.developmentBaseEndpointUrl
        case .test:
            baseUrl = ConstantEndpoints.BaseUrls.developmentBaseEndpointUrl
        case .qualityAssurance:
            baseUrl = ConstantEndpoints.BaseUrls.developmentBaseEndpointUrl
        }
    }
    
    func returnBaseUrl() -> String {
        return baseUrl
    }
    
}
