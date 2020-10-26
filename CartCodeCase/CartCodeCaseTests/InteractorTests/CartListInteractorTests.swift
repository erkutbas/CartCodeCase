//
//  CartListInteractorTests.swift
//  CartCodeCaseTests
//
//  Created by Erkut Bas on 25.10.2020.
//

import XCTest

class CartListInteractorTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_CartListSuccess_ListenCallBacks() {
        
        loadCartListResponseWithSuccess()
        sampleCartListCallBack.commonResult { [weak self](result) in
            switch result {
            case .failure(let eror):
                XCTFail("Did not supply fake result")
            case .success(let data):
                print("data gathered")
                XCTAssertEqual(data, SampleCartListResults.cartListResponse)
            }
        }
        interactor.getCartListData(parameters: sampleRequest, callBack: sampleCartListCallBack)
        
    }
    
    // Mark: - Helper Methods, Properties and Classes -
    
    private var useCase: FakeUseCase!
    private var interactor = MainInteractor()
    private var factory = CartOperationsFactoryManager()
    private var sampleRequest = CartListRequest()
    private var sampleCartListCallBack = CartListCallBack()
    
    struct SampleCartListResults {
        static let successfulResult: Result<CartListResponse, ErrorResponse> =  Result.success(SampleCartListResults.cartListResponse)
        static let cartListResponse = CartListResponse(products: SampleCartListResults.products)
        static let products = [Product(productID: "1", name: "elma", price: 2, image: ""),
                               Product(productID: "2", name: "armut", price: 3, image: ""),
                               Product(productID: "3", name: "et", price: 10, image: "")]
    }
    
    private func loadCartListResponseWithSuccess() {
        useCase = FakeUseCase(repository: factory.returnRepository())
        useCase.resultSuccess = SampleCartListResults.cartListResponse
    }
    
    class FakeUseCase: CartListUseCase {
        
        var resultSuccess: CartListResponse?
        
        override func execute(useCaseCallBack: UseCaseCallBack<CartListResponse>, params: CartListRequest) {
         
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
