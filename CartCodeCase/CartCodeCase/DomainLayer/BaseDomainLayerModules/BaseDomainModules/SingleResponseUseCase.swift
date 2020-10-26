//
//  SingleResponseUseCase.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

class SingleResponseUseCase<Params, T>: BaseUseCase<Params, T> {
    
    func execute(useCaseCallBack: UseCaseCallBack<T>, params: Params) {
        
        generateUseCase(parameter: params) { (result) in
            
            switch result {
            case .failure(let error):
                self.onErrorCondition(useCaseCallBack: useCaseCallBack, error: error)
            case .success(let data):
                useCaseCallBack.onSuccess(response: data)
            }
            
        }
        
    }
    
    private func onErrorCondition(useCaseCallBack: UseCaseCallBack<T>, error: Error) {
        print("")
        guard let error = error as? ErrorResponse else { return }
        useCaseCallBack.onError(error: error)
    }
    
    deinit {
        print("DEINIT SingleResponseUseCase")
    }
    
}
