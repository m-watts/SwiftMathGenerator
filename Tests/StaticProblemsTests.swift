//
//  Tests.swift
//  Tests
//
//  Created by Martin Watts on 27/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import XCTest
@testable import SwiftMathGenerator

class StaticProblemsTests: XCTestCase {
    
    /// Test 2+1 = 3
    func testAddition() throws {
        let a = MathExpression(lhs: .Integer(2), rhs: .Integer(1), operation: .addition)
        
        XCTAssert("\(a)" == "2 + 1")
        XCTAssert("\(a.result!)" == "3")
    }
    
    /// Test 2.2 + 3.7 = 5.9
    func testSimpleAdditionWithDecimal() throws {
        let a = MathExpression(lhs: .Decimal(2.2), rhs: .Decimal(3.7), operation: .addition)
        
        XCTAssertEqual("\(a)", "2.2 + 3.7", "Expression must be 2.2 + 3.7")
        XCTAssert("\(a.result!)" == "5.9")
    }
    
    /// Test 234 - 91 = 132
    func testSimpleSubtraction() throws {
        let a = MathExpression(lhs: .Integer(223), rhs: .Integer(91), operation: .subtraction)
        
        XCTAssert("\(a)" == "223 - 91")
        XCTAssert("\(a.result!)" == "132")
    }
    
    /// Test 3 * 3 = 9
    func testSimpleMultiplication() throws {
        let a = MathExpression(lhs: .Integer(3), rhs: .Integer(3), operation: .multiplication)
        
        XCTAssert("\(a)" == "3 * 3")
        XCTAssert("\(a.result!)" == "9")
    }
    
    /// Test 10 / 2 = 5
    func testSimpleDivision() throws {
        let a = MathExpression(lhs: .Integer(10), rhs: .Integer(2), operation: .division)
        
        XCTAssert("\(a)" == "10 / 2")
        XCTAssert("\(a.result!)" == "5")
    }
    
    func testSimpleDivisionIntergerDivisionResultsInDecimal() throws {
        let a = MathExpression(lhs: .Integer(1), rhs: .Integer(2), operation: .division)
        
        XCTAssert("\(a)" == "1 / 2")
        XCTAssert("\(a.result!)" == "0.5")
    }
    
    func testSimpleDivisionWithDecimalResult() throws {
        let a = MathExpression(lhs: .Integer(5), rhs: .Integer(4), operation: .division)
        
        XCTAssert("\(a)" == "5 / 4")
        XCTAssert("\(a.result!)" == "1.25")
    }
    
    func testMultiplyDecimalToInteger() throws {
        let a = MathExpression(lhs: .Decimal(3.5), rhs: .Integer(2), operation: .multiplication)
        
        XCTAssert("\(a)" == "3.5 * 2")
        XCTAssert("\(a.result!)" == "7")
    }
    
    func testParenthesisExpression() throws {
        let a = MathExpression(
            lhs: .Expression(MathExpression(lhs: .Integer(2), rhs: .Integer(2), operation: .addition, parenthesis: true)),
            rhs: .Integer(2),
            operation: .multiplication)
        
        
        XCTAssert("\(a)" == "(2 + 2) * 2")
        XCTAssert("\(a.result!)" == "8")
    }
    
    func testParenthesisIsFalseExpression() throws {
        let a = MathExpression(
            lhs: .Expression(MathExpression(lhs: .Integer(2), rhs: .Integer(2), operation: .addition)),
            rhs: .Integer(2),
            operation: .multiplication)
        
        XCTAssert("\(a)" == "2 + 2 * 2")
        XCTAssert("\(a.result!)" == "6")
    }
    
    func testThreeTerms() throws {
        let a = MathExpression(
            lhs: .Expression(MathExpression(lhs: .Integer(293), rhs: .Integer(100), operation: .addition)),
            rhs: .Integer(50),
            operation: .subtraction)
        
        XCTAssert("\(a)" == "293 + 100 - 50")
        XCTAssert("\(a.result!)" == "343")
    }
    
    func testFirstTermNegative() throws {
        let a = MathExpression(
            lhs: .Integer(-3),
            rhs: .Integer(44),
            operation: .addition)
        
        XCTAssert("\(a)" == "-3 + 44")
        XCTAssert("\(a.result!)" == "41")
    }
    
    func testExponentSimple() throws {
        let a = MathExpression(
            lhs: .Integer(3),
            rhs: .Integer(4),
            operation: .exponent)
        
        XCTAssert("\(a)" == "3 ^ 4")
        XCTAssert("\(a.result!)" == "81")
    }
    
    func testExponentComplex() throws {
        let a = MathExpression(
            lhs: .Integer(3),
            rhs: .Expression(MathExpression(lhs: .Integer(2), rhs: .Integer(1), operation: .addition, parenthesis: true)),
            operation: .exponent)
        
        XCTAssert("\(a)" == "3 ^ (2 + 1)")
        XCTAssert("\(a.result!)" == "27")
    }
    
    func testParenthesisMultiplication() throws {
        let a = MathExpression(
            lhs: .Expression(MathExpression(lhs: .Integer(1), rhs: .Integer(2), operation: .addition, parenthesis: true)),
            rhs: .Expression(MathExpression(lhs: .Integer(3), rhs: .Integer(4), operation: .addition, parenthesis: true)),
            operation: .multiplication)
        
        print("\(a)")
        print("\(a.result!)")
        XCTAssert("\(a)" == "(1 + 2) * (3 + 4)")
        XCTAssert("\(a.result!)" == "21")
    }
    
    
    /// NSExpression assumes a parenthesis around the first terms, making it (3^3)^3, google however assumes 3^(3^3)
    func testExponentOfExponent() throws {
        let a = MathExpression(
            lhs: .Integer(3),
            rhs: .Expression(MathExpression(lhs: .Integer(3), rhs: .Integer(3), operation: .exponent)),
            operation: .exponent)
        
        XCTAssert("\(a)" == "3 ^ 3 ^ 3")
        XCTAssert("\(a.result!)" == "19683")
    }
    
    
    func testRounding() throws {
        let a = MathExpression(
            lhs: .Integer(1),
            rhs: .Integer(3),
            operation: .division)
        let c : MathConfig = getBasicConfig()
        let p : MathProblem = MathProblem(config: c, lhs: a)
        
        XCTAssert("\(p)" == "1 / 3")
        XCTAssert("\(p.result)" == "0.33")
    }
    
    func testRoundingOneDecimal() throws {
        let a = MathExpression(
            lhs: .Decimal(0.1),
            rhs: .Integer(1),
            operation: .addition)
        let c : MathConfig = getBasicConfig()
        let p : MathProblem = MathProblem(config: c, lhs: a)
        
        XCTAssert("\(p)" == "0.1 + 1")
        XCTAssert("\(p.result)" == "1.1")
    }
    
    func testRoundingNoDecimalsInResult() throws {
        let a = MathExpression(
            lhs: .Integer(1),
            rhs: .Integer(1),
            operation: .division)
        let c : MathConfig = getBasicConfig()
        let p : MathProblem = MathProblem(config: c, lhs: a)
        
        XCTAssert("\(p)" == "1 / 1")
        XCTAssert("\(p.result)" == "1")
    }
    
    func testConstant() {
        let a = MathExpression(
            lhs: .Integer(0),
            rhs: .Constant(.pi),
            operation: .addition)
        let c : MathConfig = getBasicConfig()
        let p : MathProblem = MathProblem(config: c, lhs: a)
        
        XCTAssert("\(p)" == "0 + π")
        XCTAssert("\(p.result)" == "3.14")
    }
    
    private func getBasicConfig() -> MathConfig {
        let operations : [(operation: MathOperation, weight: Int)] = [(.addition, 1), (.subtraction, 1), (.multiplication, 1), (.division, 1)]
        return MathConfig(problemAmount: 10, allowedOperations: operations, allowDecimals: true, digitsAfterDecimal: 2, numElementsLower: 2, numElementsUpper: 5)
    }
    
    
    
}
