//
//  ImageContainer.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import UIKit

class ImageContainer: GenericBaseView<ImageContainerData> {
    
    lazy var imageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.contentMode = .scaleAspectFill
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addImageView()
    }
    
    private func addImageView() {
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
        
            imageView.heightAnchor.constraint(equalToConstant: returnContentSize().0),
            imageView.widthAnchor.constraint(equalToConstant: returnContentSize().1),
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        
        guard let data = returnData() else { return }
        imageView.image = data.image
        
    }
    
    private func returnContentSize() -> (CGFloat, CGFloat) {
        guard let data = returnData() else { return (50, 50) }
        return (data.height, data.width)
    }
    
}
