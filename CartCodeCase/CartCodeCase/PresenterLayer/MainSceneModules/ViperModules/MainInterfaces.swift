//
//  MainInterfaces.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol MainWireframeInterface: WireframeInterface {
}

protocol MainViewInterface: ViewInterface {
    func informViewToLoadData()
}

protocol MainPresenterInterface: PresenterInterface {
    func getNumberOfSection() -> Int
    func getNumberOfItems(in section: Int) -> Int
    func getWidgetComponentItem(index: Int) -> GenericDataProtocol?
    func fireProductDetailFlow(item: String?)
}

protocol MainFormatterInterface: FormatterInterface {
    func setData(with response: CartListResponse)
    func returnNumberOfSection() -> Int
    func returnNumberOfItems(in section: Int) -> Int
    func returnWidgetComponentItem(index: Int) -> GenericDataProtocol?
}

protocol MainInteractorInterface: InteractorInterface {
    func getCartListData(parameters: CartListRequest, callBack: CartListCallBack)
    func saveToCoreData(data: Array<Product>)
}
