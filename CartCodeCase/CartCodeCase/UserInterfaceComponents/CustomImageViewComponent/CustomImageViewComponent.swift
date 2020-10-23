//
//  CustomImageViewComponent.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import UIKit

class CustomImageViewComponent: UIImageView  {
    
    private lazy var cacheManager = ImageCacheFactory().returnImageCacher()
    
    private var imageUrlString: String?
    
    func setData(componentData: CustomImageViewComponentData) {
        
        DispatchQueue.main.async { [weak self] in
            self?.imageLoadingProcess(componentData: componentData)
        }
        
    }
    
    private func imageLoadingProcess(componentData: CustomImageViewComponentData) {
        imageUrlString = componentData.imageUrl
        
        image = nil
        
        if let cachedImage = returnImageFromCache(imageUrl: componentData.imageUrl) {
            image = cachedImage
            return
        }
        
        guard let url = URL(string: componentData.imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("error : \(String(describing: error))")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.handleTaskResponse(data: data, imageUrl: componentData.imageUrl)
            }
            
        }.resume()
    }
    
    private func handleTaskResponse(data: Data?, imageUrl: String) {
        guard let data = data, let image = UIImage(data: data) else { return }
        
        if self.imageUrlString == imageUrl {
            UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve) { [weak self] in
                self?.image = image
            }

//            self.image = image
        }
        
        setImageToCache(key: imageUrl, object: image)
        
    }
    
    private func returnImageFromCache(imageUrl: String) -> UIImage? {
        guard let cachedImage = cacheManager.returnImagesFromCache(key: imageUrl) else { return nil }
        return cachedImage
    }
    
    private func setImageToCache(key: String, object: UIImage) {
        cacheManager.setImagesToCache(object: object, key: key)
    }
    
}
