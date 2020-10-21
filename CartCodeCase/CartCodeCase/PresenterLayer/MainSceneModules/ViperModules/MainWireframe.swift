//
//  MainWireframe.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 20.10.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MainWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: MainViewController.self)
        super.init(viewController: moduleViewController)

        let formatter = MainFormatter()
        let interactor = MainInteractor()
        let presenter = MainPresenter(view: moduleViewController, formatter: formatter, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension MainWireframe: MainWireframeInterface {
}