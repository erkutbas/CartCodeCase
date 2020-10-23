//
//  DetailFormatter.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class DetailFormatter {
    
    private var productDetailResponse: ProductDetailResponse?
    
}

// MARK: - Extensions -

extension DetailFormatter: DetailFormatterInterface {
    
    func setProductDetailResponse(data: ProductDetailResponse) {
        self.productDetailResponse = data
    }
    
    func returnProductViewComponentData() -> ProductViewComponentData? {
        guard let data = productDetailResponse else { return nil }
        
        return ProductViewComponentData(productId: data.productID, imageData: CustomImageViewComponentData(imageUrl: data.image ?? ""), productInfoData: ProductBottomInfoComponentData(productNameData: ProductNameLabelData(name: data.name ?? LocalizableManager.productNameDoesNotExist.value), productPriceData: PriceInfoLabelData(price: data.price ?? 0.0)).setProductDetailData(with: ProductDetailLabelData(description: data.productDescription ?? LocalizableManager.productDescriptionDoesNotExist.value))).setShadowOption(with: true)
        
    }
    
}
