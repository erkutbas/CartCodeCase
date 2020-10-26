//
//  ImageCacheFactory.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import Foundation

class ImageCacheFactory {
    
    func returnImageCacher() -> ImageCacheManager {
        return ImageCacheManager.shared
    }
    
}
