//
//  CoreDataFactory.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

class CoreDataFactory {
    
    func returnCoreDataInstance() -> CoreDataManager {
        return CoreDataManager.shared
    }
    
    func returnImageCoreDataManager() -> ImageCoreDataManager {
        return ImageCoreDataManager.shared
    }
    
}
