//
//  ImageCacheManager.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import UIKit

class ImageCacheManager {
    
    public static let shared = ImageCacheManager()
    
    private let imageCache = NSCache<NSString, UIImage>()
    
    func setImagesToCache(object: UIImage, key: String) {
        imageCache.setObject(object, forKey: NSString(string: key))
    }
    
    func returnImagesFromCache(key: String) -> UIImage? {
        return imageCache.object(forKey: NSString(string: key))
    }
    
}
