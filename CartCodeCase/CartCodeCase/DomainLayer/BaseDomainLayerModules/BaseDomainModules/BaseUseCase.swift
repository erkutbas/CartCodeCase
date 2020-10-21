//
//  BaseUseCase.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//

import Foundation

class BaseUseCase<P, T>: BaseUseCaseInterface {
    
    typealias Parameters = P
    typealias Responses = T
    
    func generateUseCase(parameter: P, completion: @escaping (Result<T, ErrorResponse>) -> Void) {
        
    }
    
    deinit {
        print("DEINIT BaseUseCase")
    }
}
