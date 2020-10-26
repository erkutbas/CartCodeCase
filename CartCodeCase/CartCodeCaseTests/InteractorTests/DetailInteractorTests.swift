//
//  DetailInteractorTests.swift
//  CartCodeCaseTests
//
//  Created by Erkut Bas on 25.10.2020.
//

import XCTest

class DetailInteractorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_ProductDetail_ListenCallBacks() {
        
        loadMovieListWithSuccess()
        productDetailCallBack.commonResult { [weak self](result) in
            switch result {
            case .failure(let eror):
                XCTFail("Did not supply fake result")
            case .success(let data):
                print("product detail data gathered")
                XCTAssertEqual(data, SampleProductDetailResults.productDetailResponse)
            }
        }
        
        interactor.getProductDetailResponse(callBack: productDetailCallBack, params: sampleRequest)
        
        
    }
    
    // Mark: - Helper Methods, Properties and Classes -
    
    private var productDetailUseCase: FakeUseCase!
    private var interactor = DetailInteractor()
    private var factory = CartOperationsFactoryManager()
    private var sampleRequest: ProductDetailRequest!
    private var productDetailCallBack = ProductDetailCallBack()
    
    struct SampleProductDetailResults {
        static let successfulResult: Result<ProductDetailResponse, ErrorResponse> =  Result.success(SampleProductDetailResults.productDetailResponse)
        static let productDetailResponse = ProductDetailResponse(productID: "1", name: "elma", price: 2, image: "", productDescription: "sulu elma")
    }
    
    private func loadMovieListWithSuccess() {
        productDetailUseCase = FakeUseCase(repository: factory.returnRepository())
        productDetailUseCase.resultSuccess = SampleProductDetailResults.productDetailResponse
        sampleRequest = ProductDetailRequest(productId: "1")
    }
    
    class FakeUseCase: ProductDetailUseCase {
        
        var resultSuccess: ProductDetailResponse?
        
        override func execute(useCaseCallBack: UseCaseCallBack<ProductDetailResponse>, params: ProductDetailRequest) {
         
            useCaseCallBack.commonResult { (result) in
                switch result {
                case .failure(let error):
                    print("error")
                case .success(let data):
                    self.resultSuccess = data
                }
            }
            
        }
        
    }

}
