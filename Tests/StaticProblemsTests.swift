//
//  Tests.swift
//  Tests
//
//  Created by Martin Watts on 27/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import XCTest

class StaticProblemsTests: XCTestCase {

    func testExample() throws {
        let f = MathExpression(lhs: .Expression(expression: MathExpression(lhs: .Integer(value: 1), rhs: .Integer(value: 2), operation: .addition)), rhs: .Expression(expression: MathExpression(lhs: .Integer(value: 3), rhs: .Integer(value: 4), operation: .addition)), operation: .multiplication)
        let g = MathExpression(lhs: .Expression(expression: MathExpression(lhs: .Integer(value: 2), rhs: .Integer(value: 2), operation: .addition)), rhs: .Integer(value: 2), operation: .multiplication)
        
        print("\(f) = \(f.result!)")
        print("\(g) = \(g.result!)")
    }

    func testSimpleAddition() throws {
        let a = MathExpression(lhs: .Integer(value: 2), rhs: .Integer(value: 1), operation: .addition)
        
        XCTAssert("\(a)" == "2 + 1")
        XCTAssert("\(a.result!)" == "3")
    }
    
    func testSimpleAdditionWithDecimal() throws {
        let a = MathExpression(lhs: .Decimal(value: 2.2), rhs: .Decimal(value: 3.7), operation: .addition)
        
        XCTAssert("\(a)" == "2.2 + 3.7")
        XCTAssert("\(a.result!)" == "5.9")
    }

    func testSimpleSubtraction() throws {
        let a = MathExpression(lhs: .Integer(value: 223), rhs: .Integer(value: 91), operation: .subtraction)
        
        XCTAssert("\(a)" == "223 - 91")
        XCTAssert("\(a.result!)" == "132")
    }
    
    func testSimpleMultiplication() throws {
        let a = MathExpression(lhs: .Integer(value: 3), rhs: .Integer(value: 3), operation: .multiplication)
        
        XCTAssert("\(a)" == "3 * 3")
        XCTAssert("\(a.result!)" == "9")
    }
    
    func testSimpleDivision() throws {
        let a = MathExpression(lhs: .Integer(value: 10), rhs: .Integer(value: 2), operation: .division)
        
        XCTAssert("\(a)" == "10 / 2")
        XCTAssert("\(a.result!)" == "5")
    }
    
    func testSimpleDivisionWithDecimalResult() throws {
        let a = MathExpression(lhs: .Integer(value: 5), rhs: .Integer(value: 4), operation: .division)
        
        XCTAssert("\(a)" == "5 / 4")
        XCTAssert("\(a.result!)" == "1.25")
    }
    
    func testParenthesisExpression() throws {
        let a = MathExpression(lhs: .Expression(expression: MathExpression(lhs: .Integer(value: 2), rhs: .Integer(value: 2), operation: .addition)), rhs: .Integer(value: 2), operation: .multiplication)

        
        XCTAssert("\(a)" == "(2 + 2) * 2")
        XCTAssert("\(a.result!)" == "8")
    }
    
    func testParenthesisIsFalseExpression() throws {
        let a = MathExpression(lhs: .Expression(expression: MathExpression(lhs: .Integer(value: 2), rhs: .Integer(value: 2), operation: .addition, parenthesis: false)), rhs: .Integer(value: 2), operation: .multiplication)

        
        print("\(a) = \(a.result!)")
        
        XCTAssert("\(a)" == "2 + 2 * 2")
        XCTAssert("\(a.result!)" == "6")
    }
}
