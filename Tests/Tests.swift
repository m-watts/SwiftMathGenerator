//
//  Tests.swift
//  Tests
//
//  Created by Martin Watts on 27/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import XCTest

class Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        var e = MathExpression(lhs: .Integer(value: 2), rhs: .Integer(value: 1), operation: .addition)
        
        
        print("\(e)")
        print("\(e.result!)")
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
