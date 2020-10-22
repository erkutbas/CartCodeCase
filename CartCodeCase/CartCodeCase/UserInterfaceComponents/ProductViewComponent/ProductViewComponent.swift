//
//  ProductViewComponent.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import UIKit

class ProductViewComponent: GenericBaseView<GenericDataProtocol> {
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .white
        return temp
    }()
    
    private lazy var imageComponent: CustomImageViewComponent = {
        let temp = CustomImageViewComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.contentMode = .scaleAspectFit
        return temp
    }()
    
    private lazy var productInfoComponent: ProductBottomInfoComponent = {
        let temp = ProductBottomInfoComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(containerView)
        containerView.addSubview(imageComponent)
        containerView.addSubview(productInfoComponent)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            imageComponent.heightAnchor.constraint(equalToConstant: 100),
            imageComponent.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            imageComponent.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            imageComponent.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            
            productInfoComponent.topAnchor.constraint(equalTo: imageComponent.bottomAnchor, constant: 10),
            productInfoComponent.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            productInfoComponent.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            productInfoComponent.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
            
        
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        setViewData()
    }
    
    private func setViewData() {
        guard let data = returnData() as? ProductViewComponentData else { return }
        imageComponent.setData(componentData: data.imageData)
        productInfoComponent.setData(data: data.productInfoData)
    }
    
}
