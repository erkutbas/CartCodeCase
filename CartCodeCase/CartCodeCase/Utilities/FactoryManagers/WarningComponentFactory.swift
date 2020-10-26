//
//  WarningComponentFactory.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import Foundation

class WarningComponentFactory {
    
    func getWarningComponent(type: WarningTypes) -> WarningViewComponentData {
        switch type {
        case .noData:
            return WarningViewComponentData()
                .setWarningInfo(with: WarningInfoComponentData()
                                    .setSubTitle(with: WarningLocalizableManager.cachedDataNotExistsTitle.value)
                                    .setSubTitle(with: WarningLocalizableManager.cachedDataNotExistsSubtitle.value))
        case .noConnection:
            return WarningViewComponentData()
            
        case .savedDataExists:
            return WarningViewComponentData()
        }
    }
    
}


