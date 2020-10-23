//
//  ProductDetailResponse.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import Foundation

// MARK: - ProductListResponse
class ProductDetailResponse: BaseResponse {
    let productID: String?
    let name: String?
    let price: Double?
    let image: String?
    let productDescription: String?

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case name, price, image
        case productDescription = "description"
    }

    init(productID: String?, name: String?, price: Double?, image: String?, productDescription: String?) {
        self.productID = productID
        self.name = name
        self.price = price
        self.image = image
        self.productDescription = productDescription
    }
}
