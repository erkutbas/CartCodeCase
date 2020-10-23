//
//  AlertControllerGenerator.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import UIKit

enum AlertControllerGenerator: GenericValueProtocol {
    typealias Value = UIAlertController
    
    case noNetwork(AlertControllerData)
    case savedData(AlertControllerData)
    
    var value: UIAlertController {
        switch self {
        case .noNetwork(let data):
            let controller = UIAlertController(title: WarningLocalizableManager.noNetworkTitle.value, message: WarningLocalizableManager.noNetworkDetail.value, preferredStyle: .alert)

            data.actions.forEach { (actionData) in
                
                let action = UIAlertAction(title: actionData.actionTitle, style: actionData.actionStyle, handler: actionData.actionHandler)
                controller.addAction(action)
                
            }
            
            return controller
         
        case .savedData(let data):
            
            let controller = UIAlertController(title: WarningLocalizableManager.cachedDataExistTitle.value, message: WarningLocalizableManager.cachedDataExistSubtitle.value, preferredStyle: .alert)

            data.actions.forEach { (actionData) in
                
                let action = UIAlertAction(title: actionData.actionTitle, style: actionData.actionStyle, handler: actionData.actionHandler)
                controller.addAction(action)
                
            }
            
            return controller
            
        }
    }
}
