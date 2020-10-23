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
    private let factory = CartOperationsFactoryManager()
    
    func setImagesToCache(object: UIImage, key: String) {
        imageCache.setObject(object, forKey: NSString(string: key))
        //saveImagesIntoCoreData(object: object, key: key)
    }
    
    func returnImagesFromCache(key: String) -> UIImage? {
        return imageCache.object(forKey: NSString(string: key))
    }
    
    func saveImagesIntoCoreData(object: UIImage, key: String) {
        guard let imageData = object.pngData() else { return }
        factory.createProductImageSaveUseCase().execute(params: ProductImageSaveRequest(imageData: imageData, imageUrl: key))
    }
    
}
