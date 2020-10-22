//
//  ProductImageSaveRequest.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import Foundation

class ProductImageSaveRequest {
    private(set) var imageData: Data
    private(set) var imageUrl: String
    
    init(imageData: Data, imageUrl: String) {
        self.imageData = imageData
        self.imageUrl = imageUrl
    }
}
