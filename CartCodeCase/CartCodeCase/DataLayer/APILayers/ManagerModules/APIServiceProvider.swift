//
//  APIServiceProvider.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

class ApiServiceProvider<T: CodableDataProtocol>: URLRequestProtocol {

    private var method: HTTPMethod
    private var path: String?
    private var data: T?
    
    init(method: HTTPMethod = .get, path: String? = nil, data: T? = nil) {
        self.method = method
        self.path = path
        self.data = data
    }
    
    public func returnUrlRequest() throws -> URLRequest {
        
        var url = try UtilityManager.returnBaseUrl(environment: .development).asURL()
        
        if let path = path {
            url = url.appendingPathComponent(path)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.headers = headers
        
        try configureEncoding(request: &request)
        
        return request
    }
    
    private func configureEncoding(request: inout URLRequest) throws {
        switch method {
        case .post, .put:
            try ParameterEncoding.jsonEncoding.encode(urlRequest: &request, parameters: params)
        case .get:
            try ParameterEncoding.urlEncoding.encode(urlRequest: &request, parameters: params)
        default:
            try ParameterEncoding.urlEncoding.encode(urlRequest: &request, parameters: params)
        }
    }
    
    
//    func asURLRequest() throws -> URLRequest {
//        var url = try UtilityManager.returnBaseUrl(environment: .development).asURL()
//
//        if let path = path {
//            url = url.appendingPathComponent(path)
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = method.rawValue
//        request.headers = headers
//        request.cachePolicy = .reloadIgnoringCacheData
//
//        return try encoding.encode(request, with: params)
//
//    }
    
//    // MARK: - Encoding -
//    private var encoding: ParameterEncoder {
//        switch method {
//        case .post, .put:
//            return JSONEncoding.
//        case .get:
//            return URLEncoding.queryString
//        default:
//            return URLEncoding.queryString
//        }
//    }
    
    private var params: Parameters? {
        return data.asDictionary()
    }

    private var headers: HTTPHeaders {
        var httpHeaders = HTTPHeaders()
        httpHeaders.add(HTTPHeader(name: HTTPHeaderFields.contentType.value.0, value: HTTPHeaderFields.contentType.value.1))
        return httpHeaders
    }
    
}
