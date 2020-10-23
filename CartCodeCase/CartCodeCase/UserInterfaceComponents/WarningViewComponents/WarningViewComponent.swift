//
//  WarningViewComponent.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 23.10.2020.
//

import UIKit

class WarningViewComponent: GenericBaseView<WarningViewComponentData> {
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        temp.layer.cornerRadius = 6
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = .zero
        temp.layer.shadowRadius = 2
        temp.layer.shadowOpacity = 0.4
        return temp
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [imageContainer, warningInfo])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 20
        return temp
    }()
    
    private lazy var imageContainer: ImageContainer = {
        let temp = ImageContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var warningInfo: WarningInfoComponent = {
        let temp = WarningInfoComponent()
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
    
    override func setupViews() {
        super.setupViews()
        
        activationManager(active: false)
    }
    
    override func addMajorFields() {
        super.addMajorFields()
        
        addMainStackView()
    }
    
    private func addMainStackView() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            
            containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30),
            
        ])
        
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        setViewData()
    }
    
    private func setViewData() {
        guard let data = returnData() else { return }
        imageContainer.setData(data: data.warningIcon)
        warningInfo.setData(data: data.warningInfo)
    }
    
    func activationManager(active: Bool, animated: Bool = false) {
        if animated {
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.alpha = active ? 1 : 0
            }
        } else {
            alpha = active ? 1 : 0
        }
        
    }
    
}
