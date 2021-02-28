//
//  AIAStockAPITests.swift
//  AIAStockTests
//
//  Created by Zharif Hadi  on 01/03/2021.
//

@testable import AIAStock
import XCTest

class AIAStockAPITests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testDailyAdjustedWithResult() {
        let exp = expectation(description: "info")
        var response: Data?
        
        APIWorker.fetchDailyAdjusted(symbol: "IBM") { result in
            response = result as? Data
            exp.fulfill()
        } fail: { error in
            XCTFail("Error: \(error.localizedDescription)")
        }
        
        waitForExpectations(timeout: 1) { _ in
            XCTAssertNotNil(response)
        }
    }
    
    func testIntraDayWithResult() {
        let exp = expectation(description: "info")
        var response: Data?
        
        APIWorker.fetchIntraDay(symbol: "IBM") { result in
            response = result as? Data
            exp.fulfill()
        } fail: { error in
            XCTFail("Error: \(error.localizedDescription)")
        }
        
        waitForExpectations(timeout: 1) { _ in
            XCTAssertNotNil(response)
        }
    }
}
