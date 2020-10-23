//
//  ImageCacheManager.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import UIKit
import CoreData

class ImageCacheManager {
    
    public static let shared = ImageCacheManager()
    
    private let imageCache = NSCache<NSString, UIImage>()
    private let factory = CoreDataFactory()
    
    func setImagesToCache(object: UIImage, key: String) {
        imageCache.setObject(object, forKey: NSString(string: key))
        factory.returnImageCoreDataManager().appendNewItem(ImageCoreDataStruct(image: object, imageUrl: key))
    }
    
    func returnImagesFromCache(key: String) -> UIImage? {
        return imageCache.object(forKey: NSString(string: key))
    }
    
}
