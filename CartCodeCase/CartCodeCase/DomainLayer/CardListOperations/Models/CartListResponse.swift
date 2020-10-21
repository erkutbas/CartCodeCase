//
//  CartListResponse.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

// MARK: - CartListResponse
class CartListResponse: BaseResponse {
    let products: [Product]?

    init(products: [Product]?) {
        self.products = products
    }
}

// MARK: - Product
class Product: CodableDataProtocol {
    let productID: String?
    let name: String?
    let price: Int?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case name, price, image
    }

    init(productID: String?, name: String?, price: Int?, image: String?) {
        self.productID = productID
        self.name = name
        self.price = price
        self.image = image
    }
}
