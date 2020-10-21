//
//  UseCaseCallBackInteractor.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//

import Foundation

protocol UseCaseCallBackInteractor {
    
    associatedtype Response
    
    var onSuccessCompletion: ((Response) -> Void)? { get }
    
    func onSuccess(response: Response)
    func onError(error: ErrorResponse)
    
    func onSuccess(completion: @escaping (Response) -> Void)
    func onError(completion: @escaping (ErrorResponse) -> Void)
    func commonResult(completion: @escaping (Result<Response, ErrorResponse>) -> Void)
    
}
