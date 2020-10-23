//
//  DetailPresenter.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class DetailPresenter {

    // MARK: - Private properties -

    private unowned let view: DetailViewInterface
    private let formatter: DetailFormatterInterface
    private let interactor: DetailInteractorInterface
    private let wireframe: DetailWireframeInterface
    
    private let wireFrameData: DetailWireframeData!
    
    private let callBack = ProductDetailCallBack()

    // MARK: - Lifecycle -

    init(view: DetailViewInterface, formatter: DetailFormatterInterface, interactor: DetailInteractorInterface, wireframe: DetailWireframeInterface, data: DetailWireframeData) {
        self.view = view
        self.formatter = formatter
        self.interactor = interactor
        self.wireframe = wireframe
        self.wireFrameData = data
    }
    
    private func getProductDetailData() {
        guard let request = createProductDetailRequest() else { return }
        callBack.commonResult(completion: callBackListener)
        interactor.getProductDetailResponse(callBack: callBack, params: request)
    }

    private lazy var callBackListener: (Result<ProductDetailResponse, ErrorResponse>) -> Void = { [weak self] result in
        switch result {
        case .failure(let error):
            print("error : \(error)")
            
        case .success(let data):
            print(data)
            self?.formatter.setProductDetailResponse(data: data)
            self?.view.informViewToLoadData()
        }
    }
    
    private func createProductDetailRequest() -> ProductDetailRequest? {
        guard let productId = wireFrameData.productData.productId else { return nil }
        return ProductDetailRequest(productId: productId)
    }
    
}

// MARK: - Extensions -
extension DetailPresenter: DetailPresenterInterface {
    
    func viewDidLoad() {
        getProductDetailData()
    }
    
    func getProductViewComponentData(state: DetailPresenterDataViewState) -> ProductViewComponentData {
        switch state {
        case .cache:
            return wireFrameData.productData.setImageHeight(with: 300)
        case .remote:
            if let data = formatter.returnProductViewComponentData() {
                return data
            } else {
                return wireFrameData.productData.setImageHeight(with: 300)
            }
        }
    }
    
}
