//
//  APIManagerInterface.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

protocol APIManagerInterface {
    func executeRequest<R: BaseResponse>(urlRequest: URLRequest, completion: @escaping (Result<R, ErrorResponse>) -> Void)
}
