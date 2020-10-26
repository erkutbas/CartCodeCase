//
//  GenericCollectionViewCell.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import UIKit

typealias GenericDataProtocolCompletion = (GenericDataProtocol) -> Void

class GenericCollectionViewCell<DataType, ViewType: GenericBaseView<DataType>>: BaseCollectionViewCell {
    
    lazy var genericView: ViewType = {
        let temp = ViewType()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        
        contentView.addSubview(genericView)
        
        NSLayoutConstraint.activate([
        
            genericView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            genericView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            genericView.topAnchor.constraint(equalTo: contentView.topAnchor),
            genericView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
        
        ])
    }
    
    func setRowData(data: DataType) {
        genericView.setData(data: data)
    }
    
    func subscribeToSelectedRow(completion: @escaping GenericDataProtocolCompletion) {
        startPressedAnimationCommon { [weak self](finish) in
            if finish {
                guard let data = self?.genericView.returnData() as? GenericDataProtocol else { return }
                completion(data)
            }
        }
    }
    
}
