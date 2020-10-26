//
//  CartListComponentDelegate.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import Foundation

protocol CartListComponentDelegate: AnyObject {
    func getNumberOfSection() -> Int
    func getNumberOfItems(in section: Int) -> Int
    func getWidgetComponentItem(index: Int) -> GenericDataProtocol?
}
