//
//  BaseUseCaseInterface.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//

import Foundation

protocol BaseUseCaseInterface {
    
    associatedtype Parameters
    associatedtype Responses
    
    func generateUseCase(parameter: Parameters, completion: @escaping (Result<Responses, ErrorResponse>) -> Void)
}
