//
//  WarningViewComponentData.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import UIKit

class WarningViewComponentData {

    private(set) var warningIcon: ImageContainerData = ImageContainerData()
    private(set) var warningInfo: WarningInfoComponentData = WarningInfoComponentData()

    func setWarningIcon(with value: ImageContainerData) -> Self {
        self.warningIcon = value
        return self
    }
    
    func setWarningInfo(with value: WarningInfoComponentData) -> Self {
        self.warningInfo = value
        return self
    }
    
}
