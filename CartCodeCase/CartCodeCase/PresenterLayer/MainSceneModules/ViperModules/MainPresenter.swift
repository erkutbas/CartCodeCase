//
//  MainPresenter.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class MainPresenter {

    // MARK: - Private properties -

    private unowned let view: MainViewInterface
    private let formatter: MainFormatterInterface
    private let interactor: MainInteractorInterface
    private let wireframe: MainWireframeInterface
    
    private var callBack = CartListCallBack()

    // MARK: - Lifecycle -

    init(view: MainViewInterface, formatter: MainFormatterInterface, interactor: MainInteractorInterface, wireframe: MainWireframeInterface) {
        self.view = view
        self.formatter = formatter
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    private func getCartList() {
        callBack.commonResult(completion: cartListResponseListener)
        interactor.getCartListData(parameters: CartListRequest(), callBack: callBack)
    }
    
    private lazy var cartListResponseListener: (Result<CartListResponse, ErrorResponse>) -> Void = { [weak self] result in
        self?.handleCartListResponse(with: result)
    }
    
    private func handleCartListResponse(with result: Result<CartListResponse, ErrorResponse>) {
        switch result {
        case .failure(let error):
            print("cartList error : \(error)")
        case .success(let data):
            print("cartList data : \(data)")
            sendResponseToCoreData(response: data)
        }
    }
    
    private func sendResponseToCoreData(response: CartListResponse) {
        guard let data = response.products else { return }
        interactor.saveToCoreData(data: data)
    }
    
    private func checkCoreData() {
        let data = CoreDataManager.shared.fetch(CartListEntity.self)
        print("data count : \(data.count)")
        for item in data {
            print("takasi : \(item.productId)")
            print("takasi : \(item.name)")
            print("takasi : \(item.productDescription)")
        }
    }
    
}

// MARK: - Extensions -

extension MainPresenter: MainPresenterInterface {
    
    func viewDidLoad() {
        checkCoreData()
        getCartList()
    }
    
}
