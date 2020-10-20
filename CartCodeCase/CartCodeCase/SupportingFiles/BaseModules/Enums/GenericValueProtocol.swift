//
//  GenericValueProtocol.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//

import Foundation

protocol GenericValueProtocol {
    
    associatedtype Value
    var value: Value { get }
    
}
