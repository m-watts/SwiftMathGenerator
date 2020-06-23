//
//  KatexFormatterTests.swift
//  Tests
//
//  Created by Martin Watts on 22/06/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import XCTest
@testable import SwiftMathGenerator

class LatexFormatterTests: XCTestCase {
    
    
    func testResultEqual() {
        let problem =  getResultProblem(symbol: .equal)
        XCTAssert("\(problem)" == "2=2")
    }
    
    func testResultLessThanOrEqual() {
        let problem =  getResultProblem(symbol: .lessThanOrEqual)
        XCTAssert("\(problem)" == "2\\leq2")
    }
    
    func testResultNotEqualTo() {
        let problem =  getResultProblem(symbol: .notEqualTo)
        print("\(problem)")
        XCTAssert("\(problem)" == "2\\neq2")
    }
    
    func testPiSymbol(){
        let e : MathExpression = MathExpression(lhs: .Integer(2), rhs: .Constant(.pi), operation: .multiplication)
        let p : MathProblem = MathProblem(config: getBasicConfig(), lhs: .Expression(e))
        
        XCTAssert("\(p)" == "2*\\pi")
    }
    
    func testDivision(){
        let e : MathExpression = MathExpression(lhs: .Integer(2), rhs: .Integer(3), operation: .division)
        let p : MathProblem = MathProblem(config: getBasicConfig(), lhs: .Expression(e))
        
        XCTAssert("\(p)" == "2/3")
    }
    
    func testFraction(){
        let e : MathExpression = MathExpression(lhs: .Integer(2), rhs: .Integer(3), operation: .fraction)
        let p : MathProblem = MathProblem(config: getBasicConfig(), lhs: .Expression(e))

        XCTAssert("\(p)" == "\\frac{2}{3}")
    }
    
    
    func getResultProblem(symbol: ResultSymbol) -> MathProblem {
        return MathProblem(
            config: getBasicConfig(),
            lhs: .Integer(2),
            rhs: .Integer(2),
            resultSymbol: symbol
        )
        
    }
    
    private func getBasicConfig() -> MathConfig {
        let operations : [(operation: MathOperation, weight: Int)] = [(.addition, 1), (.subtraction, 1), (.multiplication, 1), (.division, 1)]
        let c = MathConfig(problemAmount: 10, allowedOperations: operations, allowDecimals: true, digitsAfterDecimal: 2, numElementsLower: 2, numElementsUpper: 5)
        c.formatter = LatexFormatter()
        
        return c
    }
}
