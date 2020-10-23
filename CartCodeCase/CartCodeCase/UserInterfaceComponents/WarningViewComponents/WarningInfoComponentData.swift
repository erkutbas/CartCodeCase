//
//  WarningInfoComponentData.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import Foundation

class WarningInfoComponentData {
    
    private(set) var title: String = WarningLocalizableManager.noNetworkTitle.value
    private(set) var subTitle: String = WarningLocalizableManager.noNetworkDetail.value

    func setTitle(with value: String) -> Self {
        self.title = value
        return self
    }
    
    func setSubTitle(with value: String) -> Self {
        self.subTitle = value
        return self
    }
    
}
