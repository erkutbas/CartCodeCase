//
//  CartOperationsEntityTests.swift
//  CartCodeCaseTests
//
//  Created by Erkut Bas on 24.10.2020.
//

import XCTest
@testable import CartCodeCase

class CartOperationsEntityTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCartListResponse() {
        
        let sample = Product(productID: "1", name: "elma", price: 2, image: "")
        XCTAssertEqual(sample.productID, "1")
        XCTAssertEqual(sample.name, "elma")
        XCTAssertEqual(sample.price, 2)
        XCTAssertEqual(sample.image, "")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
