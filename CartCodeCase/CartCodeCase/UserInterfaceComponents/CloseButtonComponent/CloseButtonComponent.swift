//
//  CloseButtonComponent.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 24.10.2020.
//

import UIKit

typealias CloseButtonListener = () -> Void

class CloseButtonComponent: GenericBaseView<CloseButtonComponentData> {
    
    private var closeButton: CloseButtonListener?
    
    private var closeIcon: ImageContainer!
    
    override func setupViews() {
        super.setupViews()
        
        addGestureRecognizer()
    }
    
    override func addMajorFields() {
        super.addMajorFields()
        
        addCloseIcon()
    }
    
    private func addCloseIcon() {
        closeIcon = ImageContainer(data: ImageContainerData().setHeight(with: 20).setWidth(with: 20).setImage(with: VisualContents.closeIcon.value))
        closeIcon.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(closeIcon)
        
        NSLayoutConstraint.activate([

            closeIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            closeIcon.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            closeIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            closeIcon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
        ])
        
    }
    
    func subscribeCloseButton(completion: @escaping CloseButtonListener) {
        closeButton = completion
    }
    
}

extension CloseButtonComponent: UIGestureRecognizerDelegate {
    private func addGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: .closeIconTapped)
        tap.delegate = self
        addGestureRecognizer(tap)
    }
    
    @objc fileprivate func closeIconTapped(_ sender: UITapGestureRecognizer) {
        isUserInteractionEnabled = false
        startPressedAnimationCommon { [weak self](finish) in
            if finish {
                self?.isUserInteractionEnabled = true
                self?.closeButton?()
            }
        }
    }
}

fileprivate extension Selector {
    static let closeIconTapped = #selector(CloseButtonComponent.closeIconTapped)
}
