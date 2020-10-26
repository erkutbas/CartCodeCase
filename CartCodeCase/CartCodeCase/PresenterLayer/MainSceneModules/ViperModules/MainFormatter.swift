//
//  MainFormatter.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MainFormatter {
    
    private var factory = ImageCacheFactory()
    private var cartListResponse: CartListResponse?
    private var productViewComponentData = Array<GenericDataProtocol>()
    
    private func cartListComponentMapper() {

        guard let response = cartListResponse, let data = response.products else { return }
        
        productViewComponentData.removeAll()
        
        productViewComponentData = data.map { (product) -> ProductViewComponentData in
            
            let imageData = CustomImageViewComponentData(imageUrl: product.image ?? "")
            let productInfoData = ProductBottomInfoComponentData(productNameData: ProductNameLabelData(name: product.name ?? ""),
                                                                 productPriceData: PriceInfoLabelData(price: product.price ?? 0.0))
            
            return ProductViewComponentData(productId: product.productID,
                                            imageData: imageData,
                                            productInfoData: productInfoData)
            
        }
        
    }
    
    private func checkCachedImage(imageUrl: String?) -> Bool {
        guard let imageUrl = imageUrl else { return false }
        
        if let _ = factory.returnImageCacher().returnImagesFromCache(key: imageUrl) {
            return true
        } else {
            return false
        }
        
    }
    
}

// MARK: - Extensions -

extension MainFormatter: MainFormatterInterface {
    
    func setData(with response: CartListResponse) {
        self.cartListResponse = response
        cartListComponentMapper()
    }

    func setData(with cartListEntity: Array<CartListEntity>) {
        
        productViewComponentData.removeAll()
        
        productViewComponentData = cartListEntity.map { (product) -> ProductViewComponentData in
            let productInfoData = ProductBottomInfoComponentData(productNameData: ProductNameLabelData(name: product.name ?? ""),
                                                                 productPriceData: PriceInfoLabelData(price: product.price ?? 0.0))
            
            if checkCachedImage(imageUrl: product.imageUrl) {
                return ProductViewComponentData(productId: product.productId,
                                                imageData: CustomImageViewComponentData(imageUrl: product.imageUrl ?? ""),
                                                productInfoData: productInfoData)
            }
            
            return ProductViewComponentData(productId: product.productId,
                                            productInfoData: productInfoData)
        }
    }
    
    func returnNumberOfSection() -> Int {
        return 1
    }
    
    func returnNumberOfItems(in section: Int) -> Int {
        return productViewComponentData.count
    }
    
    func returnWidgetComponentItem(index: Int) -> GenericDataProtocol? {
        return productViewComponentData[index]
    }
    
    func returnProductViewComponentDataForDetail(item: String) -> ProductViewComponentData? {
        guard let result = productViewComponentData.filter({ (data) -> Bool in
            guard let data = data as? ProductViewComponentData else { return false }
            if data.productId == item {
                return true
            } else {
                return false
            }
        }) as? Array<ProductViewComponentData> else { return nil }
        
        return result.getElement(at: 0)
        
    }
    
}
