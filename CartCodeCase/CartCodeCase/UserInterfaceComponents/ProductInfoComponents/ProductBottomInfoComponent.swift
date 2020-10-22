//
//  ProductBottomInfoComponent.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import UIKit

class ProductBottomInfoComponent: GenericBaseView<ProductBottomInfoComponentData> {

    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [productName, price, detail])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .fill
        temp.distribution = .fill
        temp.axis = .vertical
        return temp
    }()
    
    private lazy var productName: ProductNameLabel = {
        let temp = ProductNameLabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var price: PriceInfoLabel = {
        let temp = PriceInfoLabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        return temp
    }()
    
    private lazy var detail: ProductDetailLabel = {
        let temp = ProductDetailLabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        temp.isHidden = true
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        
        addMainStackView()
    }
    
    private func addMainStackView() {
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        setViewData()
    }
    
    private func setViewData() {
        guard let data = returnData() else { return }
        productName.setLabelData(data: data.productNameData)
        price.setLabelData(data: data.productPriceData)
        
        guard let detailData = data.productDetailData else { return }
        detail.setLabelData(data: detailData)
        detail.isHidden = false
    }
    
}
