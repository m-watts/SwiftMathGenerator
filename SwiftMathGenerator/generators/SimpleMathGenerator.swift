//
//  mathGenerator.swift
//  mathGenerator
//
//  Created by Martin Watts on 27/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

class SimpleMathGenerator : MathGenerator {

    public func generateProblems(config: MathConfig) -> [MathProblem] {
        var problems = [MathProblem]()
        
        for _ in 1...config.problemAmount {
            problems.append(generateProblem(config: config))
        }
        
        return problems
    }
    
    private func generateProblem(config: MathConfig) -> MathProblem {
        
        let numElements = Int.random(in: config.numElementsLower ... config.numElementsUpper)
        
        let expression = generateElement(remainingElements: numElements, config: config)
        
        
        
        return MathProblem(config: config, lhs: .Expression(expression))
    }
    
    /**
     Generates a math problem based on the configuration.
     */
    private func generateElement(remainingElements: Int, config: MathConfig) -> MathExpression {
        let remainder : Int = remainingElements - 1
        let e1 : MathElement = .Integer(Int.random(in: 0 ... 10))
        let e2 : MathElement
        if remainder == 0 {
            e2 = generateNumber(config);
        } else {
            e2 = .Expression(generateElement(remainingElements: remainder, config: config))
        }
        
        let ePos = Bool.random()
        let lhs = ePos ? e1 : e2
        let rhs = ePos ? e2 : e1
        
        return MathExpression(lhs: lhs, rhs: rhs, operation: randomOperation(config))
        
    }
}
