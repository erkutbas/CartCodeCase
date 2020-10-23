//
//  DetailInterfaces.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol DetailWireframeInterface: WireframeInterface {
}

protocol DetailViewInterface: ViewInterface {
}

protocol DetailPresenterInterface: PresenterInterface {
    func getProductViewComponentData(state: DetailPresenterDataViewState) -> ProductViewComponentData
}

protocol DetailFormatterInterface: FormatterInterface {
    func setProductDetailResponse(data: ProductDetailResponse)
    func returnProductViewComponentData() -> ProductViewComponentData?
}

protocol DetailInteractorInterface: InteractorInterface {
    func getProductDetailResponse(callBack: ProductDetailCallBack, params: ProductDetailRequest)
}