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
}

protocol MainPresenterInterface: PresenterInterface {
}

protocol MainFormatterInterface: FormatterInterface {
}

protocol MainInteractorInterface: InteractorInterface {
    func getCartListData(parameters: CartListRequest, callBack: CartListCallBack)
    func saveToCoreData(data: Array<Product>)
}