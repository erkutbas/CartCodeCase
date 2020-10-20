//
//  Wireframes.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//

import Foundation

enum Wireframes: GenericValueProtocol {
    
    typealias Value = BaseWireframe
    
    case main
    case detail
    
    var value: BaseWireframe {
        switch self {
        case .main:
            return MainWireframe()
        case .detail:
            return DetailWireframe()
        }
    }
    
}
