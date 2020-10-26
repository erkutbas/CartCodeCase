//
//  ImageContainerData.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import UIKit

class ImageContainerData {
    
    private(set) var image: UIImage = VisualContents.warningIcon.value
    private(set) var height: CGFloat = 50
    private(set) var width: CGFloat = 50

    func setImage(with value: UIImage) -> Self {
        self.image = value
        return self
    }
    
    func setHeight(with value: CGFloat) -> Self {
        self.height = value
        return self
    }
    
    func setWidth(with value: CGFloat) -> Self {
        self.width = value
        return self
    }
    
}
