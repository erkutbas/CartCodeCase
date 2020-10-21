//
//  ImageCacheFactoryManager.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import Foundation

class ImageCacheFactoryManager {
    
    func returnImageCacher() -> ImageCacheManager {
        return ImageCacheManager.shared
    }
    
}
