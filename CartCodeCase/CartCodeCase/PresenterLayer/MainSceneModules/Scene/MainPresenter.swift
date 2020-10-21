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

    // MARK: - Lifecycle -

    init(view: MainViewInterface, formatter: MainFormatterInterface, interactor: MainInteractorInterface, wireframe: MainWireframeInterface) {
        self.view = view
        self.formatter = formatter
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension MainPresenter: MainPresenterInterface {
}