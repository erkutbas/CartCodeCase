//
//  DetailViewController.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class DetailViewController: BaseViewController {

    private var productViewComponent: ProductViewComponent!
    private var closeIcon: CloseButtonComponent!
    
    // MARK: - Public properties -
    var presenter: DetailPresenterInterface!

    // MARK: - Lifecycle -
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        addProductViewComponent()
        addCloseIcon()
        addCloseIconListeners()
        
        presenter.viewDidLoad()
    }
    
    private func addProductViewComponent() {
        productViewComponent = ProductViewComponent(data: presenter.getProductViewComponentData(state: .cache))
        productViewComponent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(productViewComponent)
        
        NSLayoutConstraint.activate([
        
            productViewComponent.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            productViewComponent.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productViewComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            productViewComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        
        ])
        
    }
    
    private func addCloseIcon() {
        closeIcon = CloseButtonComponent()
        closeIcon.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(closeIcon)
        
        NSLayoutConstraint.activate([
        
            closeIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            closeIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 20)
        
        ])
        
    }

    private func addCloseIconListeners() {
        closeIcon.subscribeCloseButton { [weak self] in
            self?.presenter.dismissView()
        }
    }
    
}

// MARK: - Extensions -
extension DetailViewController: DetailViewInterface {
    func informViewToLoadData() {
        DispatchQueue.main.async { [weak self] in
            self?.productViewComponent.setData(data: self?.presenter.getProductViewComponentData(state: .remote))
        }
    }
}
