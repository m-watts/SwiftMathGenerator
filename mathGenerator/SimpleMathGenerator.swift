//
//  mathGenerator.swift
//  mathGenerator
//
//  Created by Martin Watts on 27/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

class SimpleMathGenerator : Generator {

    public func generateProblems(config: MathConfig) -> [MathExpression] {
        var problems = [MathExpression]()
        
        for _ in 1...config.problemAmount {
            problems.append(generateProblem(config: config))
        }
        
        return problems
    }
    
    private func generateProblem(config: MathConfig) -> MathExpression {
        
        let numElements = Int.random(in: config.numElementsLower ... config.numElementsUpper)
        
        
        let expression = generateElement(remainingElements: numElements, config: config)
        
        
        return expression
    }
    
    private func generateElement(remainingElements: Int, config: MathConfig) -> MathExpression {
        let remainder : Int = remainingElements - 1
        let e1 : MathElement = .Integer(value: Int.random(in: 0 ... 10))
        let e2 : MathElement
        if remainder == 0 {
            e2 = .Integer(value: Int.random(in: 0 ... 10))
        } else {
            e2 = .Expression(expression: generateElement(remainingElements: remainder, config: config))
        }
        
        let ePos = Bool.random()
        let lhs = ePos ? e1 : e2
        let rhs = ePos ? e2 : e1
        
        return MathExpression(lhs: lhs, rhs: rhs, operation: config.allowedOperations.randomElement()!)
        
    }
    
     
}
