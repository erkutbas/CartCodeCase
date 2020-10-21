//
//  BaseDynamicAttributedLabel.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import UIKit

class BaseDynamicAttributedLabel<T>: UILabel {

    var data: T?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.prepareLabelConfigurations()
        self.setupLabelSettings()
    }
    
    init(frame: CGRect, data: T?) {
        self.data = data
        super.init(frame: frame)
        prepareLabelConfigurations()
        setupLabelSettings()
        loadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData() {
        
    }
    
    func setLabelData(data: T?) {
        self.data = data
        loadData()
    }
    
    func returnData() -> T? {
        return data
    }
    
    func prepareLabelConfigurations() {
    }
    
    func setupLabelSettings() {
        self.numberOfLines = 0
    }
    
    func setLabelText(withData: T? = nil) {}
    
}
