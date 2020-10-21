//
//  ErrorResponse.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//

import Foundation

class ErrorResponse: Error {
    let serverResponse: ServerResponse?
    let apiConnectionErrorType: ApiConnectionErrorType?

    init(serverResponse: ServerResponse? = nil, apiConnectionErrorType: ApiConnectionErrorType? = nil) {
        self.serverResponse = serverResponse
        self.apiConnectionErrorType = apiConnectionErrorType
    }

}
