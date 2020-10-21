//
//  CompletableUseCase.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

class CompletableUseCase<Params>: BaseUseCase<Params, Completed> {
    
    func execute(params: Params) {
        generateUseCase(parameter: params) { [weak self](result) in
            // there is nothing to do
        }
        
    }
    
    deinit {
        print("DEINIT CompletableUseCase")
    }
    
}
