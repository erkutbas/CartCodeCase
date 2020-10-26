//
//  WarningLocalizableManager.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import Foundation

enum WarningLocalizableManager: GenericValueProtocol {
    
    typealias Value = String
    
    case noNetworkTitle
    case noNetworkDetail
    case okayButtonTitle
    case cachedDataNotExistsTitle
    case cachedDataNotExistsSubtitle
    case cachedDataExistTitle
    case cachedDataExistSubtitle
    
    var value: String {
        switch self {
        case .noNetworkTitle:
            return "noNetworkTitle".toLocalize()
        case .noNetworkDetail:
            return "noNetworkSubtitle".toLocalize()
        case .okayButtonTitle:
            return "okay".toLocalize()
        case .cachedDataNotExistsTitle:
            return "cachedDataNotExistsTitle".toLocalize()
        case .cachedDataNotExistsSubtitle:
            return "cachedDataNotExistsSubtitle".toLocalize()
        case .cachedDataExistTitle:
            return "cachedDataExistTitle".toLocalize()
        case .cachedDataExistSubtitle:
            return "cachedDataExistSubtitle".toLocalize()
        }
    }
    
}
