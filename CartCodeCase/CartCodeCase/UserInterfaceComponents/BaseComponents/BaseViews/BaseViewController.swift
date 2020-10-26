//
//  BaseViewController.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//


import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    var viewTitle: String? { return nil }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewControllerConfigurations()
    }
    
    open func prepareViewControllerConfigurations() {
        view.backgroundColor = .white
        setViewControllerName()
    }
    
    public static var identifier: String {
        return String(describing: self)
    }
    
    private func setViewControllerName() {
        title = viewTitle
    }
    
}
