//
//  CartListComponent.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 22.10.2020.
//

import UIKit

typealias SelectedCellCompletionBlock = (GenericDataProtocol) -> Void

class CartListComponent: GenericBaseView<CartListComponentData> {
    
    private weak var delegate: CartListComponentDelegate?
    private var selectedCell: SelectedCellCompletionBlock?
    
    private var warningViewComponent: WarningViewComponent?

    lazy var layout: UICollectionViewFlowLayout = {
        let temp = UICollectionViewFlowLayout()
        temp.scrollDirection = .vertical
        temp.minimumInteritemSpacing = 10
        temp.minimumLineSpacing = 10
//        temp.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return temp
    }()
    
    lazy var collectionView: UICollectionView = {
        let temp = UICollectionView(frame: .zero, collectionViewLayout: layout)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .white
        temp.delegate  = self
        temp.dataSource = self
        temp.genericRegisterCell(ProductViewCellComponent.self)
        return temp
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
    }
    
    override func addMajorFields() {
        super.addMajorFields()
        
        addCollectionView()
        
    }
    
    private func addCollectionView() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
        
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
    
    private func listenSelectedCell(data: GenericDataProtocol) {
        isUserInteractionEnabled = true
        selectedCell?(data)
    }
    
    // Mark: - Public Methods -
    func setComponent(delegate: CartListComponentDelegate) {
        self.delegate = delegate
    }
    
    func reloadCollectionView() {
        
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
        
    }
    
    func subscribeSelectedCell(completion: @escaping SelectedCellCompletionBlock) {
        selectedCell = completion
    }
    
    func activateBackgroundWarningView(with componentData: WarningViewComponentData? = nil) {
        if componentData != nil {
            warningViewComponent = WarningViewComponent(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 400), data: componentData)
            collectionView.backgroundView = warningViewComponent
            
            DispatchQueue.main.async { [weak self] in
                self?.warningViewComponent?.activationManager(active: true, animated: true)
            }
            
        } else {
            DispatchQueue.main.async { [weak self] in
                self?.warningViewComponent?.activationManager(active: false, animated: true)
            }
        }
        
    }
    
}

extension CartListComponent: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.getNumberOfItems(in: section) ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let data = delegate?.getWidgetComponentItem(index: indexPath.row) else { fatalError() }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductViewCellComponent.identifier, for: indexPath) as? ProductViewCellComponent else { fatalError() }
        
        cell.setRowData(data: data)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ProductViewCellComponent else { return }
        isUserInteractionEnabled = false
        cell.subscribeToSelectedRow(completion: listenSelectedCell(data:))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (UIScreen.main.bounds.width - 30) / 2, height: 200)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}
