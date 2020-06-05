//
//  MathGeneratorTests.swift
//  mathGenerator
//
//  Created by Martin Watts on 27/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import XCTest
@testable import mathGenerator

class MathGeneratorTests: XCTestCase {
    override func setUpWithError() throws {
           // Put setup code here. This method is called before the invocation of each test method in the class.
       }

       override func tearDownWithError() throws {
           // Put teardown code here. This method is called after the invocation of each test method in the class.
       }
    
    func testGenerateSimpleMath() throws{
        let a = MathExpression(lhs: .Integer(value: 2), rhs: .Integer(value: 1), operation: .addition)
        let b = MathExpression(lhs: .Integer(value: 5), rhs: .Integer(value: 17), operation: .addition)
        let c = MathExpression(lhs: .Integer(value: 223), rhs: .Integer(value: 91), operation: .subtraction)
        let d = MathExpression(lhs: .Integer(value: 3), rhs: .Integer(value: 3), operation: .multiplication)
        let e = MathExpression(lhs: .Integer(value: 10), rhs: .Integer(value: 2), operation: .division)
        let f = MathExpression(lhs: .Expression(expression: MathExpression(lhs: .Integer(value: 1), rhs: .Integer(value: 2), operation: .addition)), rhs: .Expression(expression: MathExpression(lhs: .Integer(value: 3), rhs: .Integer(value: 4), operation: .addition)), operation: .multiplication)
        let g = MathExpression(lhs: .Expression(expression: MathExpression(lhs: .Integer(value: 2), rhs: .Integer(value: 2), operation: .addition)), rhs: .Integer(value: 2), operation: .multiplication)
        
        let h = MathExpression(lhs: .Integer(value: 3), rhs: .Integer(value: 2), operation: .exponent)
        
        
        print("\(a) = \(a.result!)")
        print("\(b) = \(b.result!)")
        print("\(c) = \(c.result!)")
        print("\(d) = \(d.result!)")
        print("\(e) = \(e.result!)")
        print("\(f) = \(f.result!)")
        print("\(g) = \(g.result!)")
        print("\(h) = \(h.result!)")
    }
    
    func testSqrt() throws {
        let format = "sqrt(9)"
        let expr = NSExpression(format: format)
        print(expr.expressionValue(with: nil, context: nil) ?? 0)
    }
    
    func testExponentFraction() throws {
        let format = "9**(1/2)"
        let expr = NSExpression(format: format)
        print(expr.expressionValue(with: nil, context: nil) ?? 0)
    }
    
    func testDecimal() throws {
        let format = "1.0/2.0"
        let expr = NSExpression(format: format)
        let r = expr.expressionValue(with: nil, context: nil) as? Double
        print(r!)
    }
    
    func testOrderOfOperations() throws {
        let format = "2 + 2 * 2"
        let expr = NSExpression(format: format)
        let r = expr.expressionValue(with: nil, context: nil) as? Double
        print(r!)
    }
    
    
    func testGenerator() throws {
        let generator : MathGenerator = SimpleMathGenerator()
        let operations : [MathOperation] = [.addition, .subtraction, .multiplication, .division]
        let config = MathConfig.init(
            problemAmount: 10,
            allowedOperations: operations,
            allowDecimals: false,
            digitsAfterDecimal: 0,
            numElementsLower: 1,
            numElementsUpper: 4)

        
        
        let problems = generator.generateProblems(config: config)
        
        for problem in problems {
            print("========================")
            print("\(problem) = \(problem.result!)" )
            print("\(problem.nsExpressionFormat)")
        }
        
        
    }
    
}
