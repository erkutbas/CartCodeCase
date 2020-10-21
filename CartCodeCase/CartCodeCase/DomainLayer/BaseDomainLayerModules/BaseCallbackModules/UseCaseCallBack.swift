//
//  UseCaseCallBack.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//

import Foundation

typealias Completed = () -> Void

class UseCaseCallBack<T>: UseCaseCallBackInteractor {
    typealias Response = T
    
    var onSuccessCompletion: ((T) -> Void)?
    var onErrorCompletion: ((ErrorResponse) -> Void)?
    var onCallBackResultCompletion: ((Result<T, ErrorResponse>) -> Void)?
    var completed: Completed?

    func onSuccess(response: T) {
        onSuccessCompletion?(response)
        onCallBackResultCompletion?(.success(response))
    }
    
    func onError(error: ErrorResponse) {
        onErrorCompletion?(error)
        onCallBackResultCompletion?(.failure(error))
    }
    
    func onSuccess(completion: @escaping (T) -> Void) {
        onSuccessCompletion = completion
    }
    
    func onError(completion: @escaping (ErrorResponse) -> Void) {
        onErrorCompletion = completion
    }
    
    func commonResult(completion: @escaping (Result<T, ErrorResponse>) -> Void) {
        onCallBackResultCompletion = completion
    }
    
}
