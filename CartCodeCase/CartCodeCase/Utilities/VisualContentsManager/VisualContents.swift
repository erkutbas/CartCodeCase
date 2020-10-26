//
//  VisualContents.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import UIKit

enum VisualContents: GenericValueProtocol {
    typealias Value = UIImage
    
    case productIcon
    case warningIcon
    case closeIcon
    
    var value: UIImage {
        switch self {
        case .productIcon:
            return UIImage(imageLiteralResourceName: "new-product")
        case .warningIcon:
            return UIImage(imageLiteralResourceName: "warningIcon")
        case .closeIcon:
            return UIImage(imageLiteralResourceName: "closeIcon")
        }
    }
}
