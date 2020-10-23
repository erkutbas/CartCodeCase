//
//  ImageCoreDataManager.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 24.10.2020.
//

import UIKit

struct ImageCoreDataStruct {
    var image: UIImage
    var imageUrl: String
}

class ImageCoreDataManager {
    
    public static let shared = ImageCoreDataManager()
    
    private var factory = CartOperationsFactoryManager()
    private var dataArray = Array<ImageCoreDataStruct>()
    private var originalDataCount: Int = 0
    
    init() {
        dataArray.removeAll()
    }
    
    func appendNewItem(_ item: ImageCoreDataStruct) {
        dataArray.append(item)
        checkAndLoadDataIntoCoreData()
    }
    
    func setOriginalDataCount(with value: Int) {
        self.originalDataCount = value
    }
    
    func checkAndLoadDataIntoCoreData() {
        if dataArray.count == originalDataCount {
            
            dataArray.forEach { (data) in
                guard let pngData = data.image.pngData() else { return }
                factory.createProductImageSaveUseCase().execute(params: ProductImageSaveRequest(imageData: pngData, imageUrl: data.imageUrl))
            }
            
        }
    }
    
}
