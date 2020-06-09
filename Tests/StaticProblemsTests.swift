//
//  Tests.swift
//  Tests
//
//  Created by Martin Watts on 27/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import XCTest
@testable import mathGenerator

class StaticProblemsTests: XCTestCase {
    
    /// Test 2+1 = 3
    func testAddition() throws {
        let a = MathExpression(lhs: .Integer(value: 2), rhs: .Integer(value: 1), operation: .addition)
        
        XCTAssert("\(a)" == "2 + 1")
        XCTAssert("\(a.result!)" == "3")
    }
    
    /// Test 2.2 + 3.7 = 5.9
    func testSimpleAdditionWithDecimal() throws {
        let a = MathExpression(lhs: .Decimal(value: 2.2), rhs: .Decimal(value: 3.7), operation: .addition)
        
        XCTAssertEqual("\(a)", "2.2 + 3.7", "Expression must be 2.2 + 3.7")
        XCTAssert("\(a.result!)" == "5.9")
    }

    /// Test 234 - 91 = 132
    func testSimpleSubtraction() throws {
        let a = MathExpression(lhs: .Integer(value: 223), rhs: .Integer(value: 91), operation: .subtraction)
        
        XCTAssert("\(a)" == "223 - 91")
        XCTAssert("\(a.result!)" == "132")
    }
    
    /// Test 3 * 3 = 9
    func testSimpleMultiplication() throws {
        let a = MathExpression(lhs: .Integer(value: 3), rhs: .Integer(value: 3), operation: .multiplication)
        
        XCTAssert("\(a)" == "3 * 3")
        XCTAssert("\(a.result!)" == "9")
    }
    
    /// Test 10 / 2 = 5
    func testSimpleDivision() throws {
        let a = MathExpression(lhs: .Integer(value: 10), rhs: .Integer(value: 2), operation: .division)
        
        XCTAssert("\(a)" == "10 / 2")
        XCTAssert("\(a.result!)" == "5")
    }
    
    func testSimpleDivisionIntergerDivisionResultsInDecimal() throws {
        let a = MathExpression(lhs: .Integer(value: 1), rhs: .Integer(value: 2), operation: .division)
        
        XCTAssert("\(a)" == "1 / 2")
        XCTAssert("\(a.result!)" == "0.5")
    }
    
    func testSimpleDivisionWithDecimalResult() throws {
        let a = MathExpression(lhs: .Integer(value: 5), rhs: .Integer(value: 4), operation: .division)
        
        XCTAssert("\(a)" == "5 / 4")
        XCTAssert("\(a.result!)" == "1.25")
    }
    
    func testMultiplyDecimalToInteger() throws {
        let a = MathExpression(lhs: .Decimal(value: 3.5), rhs: .Integer(value: 2), operation: .multiplication)
        
        XCTAssert("\(a)" == "3.5 * 2")
        XCTAssert("\(a.result!)" == "7")
    }
    
    func testParenthesisExpression() throws {
        let a = MathExpression(
            lhs: .Expression(expression: MathExpression(lhs: .Integer(value: 2), rhs: .Integer(value: 2), operation: .addition, parenthesis: true)),
            rhs: .Integer(value: 2),
            operation: .multiplication)

        
        XCTAssert("\(a)" == "(2 + 2) * 2")
        XCTAssert("\(a.result!)" == "8")
    }
    
    func testParenthesisIsFalseExpression() throws {
        let a = MathExpression(
            lhs: .Expression(expression: MathExpression(lhs: .Integer(value: 2), rhs: .Integer(value: 2), operation: .addition)),
            rhs: .Integer(value: 2),
            operation: .multiplication)

        XCTAssert("\(a)" == "2 + 2 * 2")
        XCTAssert("\(a.result!)" == "6")
    }
    
    func testThreeTerms() throws {
        let a = MathExpression(
            lhs: .Expression(expression: MathExpression(lhs: .Integer(value: 293), rhs: .Integer(value: 100), operation: .addition)),
            rhs: .Integer(value: 50),
            operation: .subtraction)

        XCTAssert("\(a)" == "293 + 100 - 50")
        XCTAssert("\(a.result!)" == "343")
    }
    
    func testFirstTermNegative() throws {
        let a = MathExpression(
            lhs: .Integer(value: -3),
            rhs: .Integer(value: 44),
            operation: .addition)

        XCTAssert("\(a)" == "-3 + 44")
        XCTAssert("\(a.result!)" == "41")
    }
    
    func testExponentSimple() throws {
        let a = MathExpression(
            lhs: .Integer(value: 3),
            rhs: .Integer(value: 4),
            operation: .exponent)

        XCTAssert("\(a)" == "3 ^ 4")
        XCTAssert("\(a.result!)" == "81")
    }
    
    func testExponentComplex() throws {
        let a = MathExpression(
            lhs: .Integer(value: 3),
            rhs: .Expression(expression: MathExpression(lhs: .Integer(value: 2), rhs: .Integer(value: 1), operation: .addition, parenthesis: true)),
            operation: .exponent)

        XCTAssert("\(a)" == "3 ^ (2 + 1)")
        XCTAssert("\(a.result!)" == "27")
    }
    
    func testParenthesisMultiplication() throws {
        let a = MathExpression(
            lhs: .Expression(expression: MathExpression(lhs: .Integer(value: 1), rhs: .Integer(value: 2), operation: .addition, parenthesis: true)),
            rhs: .Expression(expression: MathExpression(lhs: .Integer(value: 3), rhs: .Integer(value: 4), operation: .addition, parenthesis: true)),
            operation: .multiplication)

        print("\(a)")
        print("\(a.result!)")
        XCTAssert("\(a)" == "(1 + 2) * (3 + 4)")
        XCTAssert("\(a.result!)" == "21")
    }
    
    
    /// NSExpression assumes a parenthesis around the first terms, making it (3^3)^3, google however assumes 3^(3^3)
    func testExponentOfExponent() throws {
        let a = MathExpression(
            lhs: .Integer(value: 3),
            rhs: .Expression(expression: MathExpression(lhs: .Integer(value: 3), rhs: .Integer(value: 3), operation: .exponent)),
            operation: .exponent)

        XCTAssert("\(a)" == "3 ^ 3 ^ 3")
        XCTAssert("\(a.result!)" == "19683")
    }
}
