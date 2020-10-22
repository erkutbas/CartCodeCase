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
        cell.subscribeToSelectedRow(completion: listenSelectedCell(data:))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (UIScreen.main.bounds.width - 30) / 2, height: 200)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}

//typealias SelectedProductCompletionHandler = (GenericComponentDataProtocol) -> Void

/*
class CartListComponent: GenericBaseView<CartListComponentData> {
    
    private weak var delegate: WidgetCollectionComponentProtocol?
    private var selectedProduct: SelectedProductCompletionHandler?
    
    private let layout = WidgetCollectionCompositionalLayoutManager()
    
    lazy var collectionView: UICollectionView = {
        let temp = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate  = self
        temp.dataSource = self
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        
        /*
         adding required components
         */
        addCollectionView()
        
    }
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = ColorSpectrum.defaultBackground
        collectionView.backgroundColor = ColorSpectrum.defaultBackground
        registerCells()
    }
    
    
    private func registerCells() {
        collectionView.genericRegisterCell(SingleBannerCellComponent.self)
        collectionView.genericRegisterCell(ProductSliderCellComponent.self)
        collectionView.genericRegisterCell(BannerSliderCellComponent.self)
        collectionView.genericRegisterCell(ProductListCellComponent.self)
        collectionView.genericRegisterCell(CarouselBannerCellComponent.self)
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
    
    private func listenProductCellSelection(_ data: GenericComponentDataProtocol) {
        isUserInteractionEnabled = true
        selectedProduct?(data)
    }
    
    // Mark: - Public Methods -
    func setComponent(delegate: WidgetCollectionComponentProtocol) {
        self.delegate = delegate
    }
    
    func reloadWidgetCollection() {
        guard let layout = layout.createCompositionalLayout(data: delegate?.getWidgetComponentsData()) else { return }
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.reloadData()
    }
    
    func subscribeProductSelection(completion: @escaping SelectedProductCompletionHandler) {
        selectedProduct = completion
    }
    
}

extension WidgetCollectionComponent: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return delegate?.getNumberOfSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.getNumberOfItems(in: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return returnCollectionViewCell(indexPath: indexPath)
    }
    
    private func returnCollectionViewCell(indexPath: IndexPath) -> BaseCollectionViewCell {

        guard let data = delegate?.getWidgetComponentItem(index: indexPath.section) else { fatalError() }
        
        switch data.componentViewType {
        case .singleBanner:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleBannerCellComponent.identifier, for: indexPath) as? SingleBannerCellComponent else { fatalError() }
            guard let componentData = data.returnGenericData(indexPath: indexPath) else { fatalError() }
            cell.setRowData(data: componentData)
            return cell
            
        case .productSlider:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductSliderCellComponent.identifier, for: indexPath) as? ProductSliderCellComponent else { fatalError() }
            guard let componentData = data.returnGenericData(indexPath: indexPath) else { fatalError() }
            cell.setRowData(data: componentData)
            return cell
            
        case .bannerSlider:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerSliderCellComponent.identifier, for: indexPath) as? BannerSliderCellComponent else { fatalError() }
            guard let componentData = data.returnGenericData(indexPath: indexPath) else { fatalError() }
            cell.setRowData(data: componentData)
            return cell
            
        case .productListing:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductListCellComponent.identifier, for: indexPath) as? ProductListCellComponent else { fatalError() }
            guard let componentData = data.returnGenericData(indexPath: indexPath) else { fatalError() }
            cell.setRowData(data: componentData)
            return cell
            
        case .carouselBanner:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselBannerCellComponent.identifier, for: indexPath) as? CarouselBannerCellComponent else { fatalError() }
            guard let componentData = data.returnGenericData(indexPath: indexPath) else { fatalError() }
            cell.setRowData(data: componentData)
            return cell
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleBannerCellComponent.identifier, for: indexPath) as? SingleBannerCellComponent else { fatalError() }
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let cell = collectionView.cellForItem(at: indexPath) as? ProductSliderCellComponent {
            isUserInteractionEnabled = false
            cell.subscribeToSelectedRow(completion: listenProductCellSelection(_:))
        } else if let cell = collectionView.cellForItem(at: indexPath) as? ProductListCellComponent {
            isUserInteractionEnabled = false
            cell.subscribeToSelectedRow(completion: listenProductCellSelection(_:))
        }
        
    }
    
    
}
 */
