//
//  MathGeneratorTests.swift
//  mathGenerator
//
//  Created by Martin Watts on 27/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import XCTest

class MathGeneratorTests: XCTestCase {
    override func setUpWithError() throws {
           // Put setup code here. This method is called before the invocation of each test method in the class.
       }

       override func tearDownWithError() throws {
           // Put teardown code here. This method is called after the invocation of each test method in the class.
       }
    
    func generateSimpleMath() throws{
        var e = MathExpression(lhs: .Integer(value: 2), rhs: .Integer(value: 1), operation: .addition)
        
        
        print("\(e)")
        print("\(e.result!)")
        
    }
}
