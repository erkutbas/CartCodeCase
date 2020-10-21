//
//  CartOperationsCoreDataManager.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

class CartOperationsCoreDataManager: CartOperationsCoreDataManagerInterface {
    
    private var coreDataManager: CoreDataManager!
    private var cardListEntities = Array<CartListEntity>()
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func saveToCoreData(cartList: Array<Product>) {

        fetchCartList()
        
        cartList.forEach { (product) in
            
            if !checkCartListProductExist(product: product) {
                let object = CartListEntity(context: coreDataManager.context)
                
                object.productId = product.productID
                object.name = product.name
                object.image = product.imageData
                
                /*
                 core data set default values on some properties such as integer, boolean, double ...
                 that's why we can not create optional price property in entity
                 */
                if let price = product.price {
                    object.price = price
                }
                
                coreDataManager.saveContext()
            }
            
        }
        
    }
    
    private func checkCartListProductExist(product: Product) -> Bool {
        cardListEntities.contains { (entity) -> Bool in
            guard let data = product.productID else { return false }
            if entity.productId == data {
                return true
            } else {
                return false
            }
        }
    }
    
    private func fetchCartList() {
        cardListEntities.removeAll()
        cardListEntities = coreDataManager.fetch(CartListEntity.self)
    }
    
    deinit {
        print("DEINIT CartOperationsCoreDataManager")
    }
    
}
