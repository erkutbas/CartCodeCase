//
//  AlertActionData.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import UIKit

class AlertActionData {
    private(set) var actionTitle: String = WarningLocalizableManager.okayButtonTitle.value
    private(set) var actionStyle: UIAlertAction.Style = .default
    private(set) var actionHandler: ((UIAlertAction) -> Void)? = nil

    init(actionHandler: ((UIAlertAction) -> Void)? = nil) {
        self.actionHandler = actionHandler
    }
    
    func setActionTitle(with value: String) -> Self {
        self.actionTitle = value
        return self
    }
    
    func setActionStyle(with value: UIAlertAction.Style) -> Self {
        self.actionStyle = value
        return self
    }
    
}
