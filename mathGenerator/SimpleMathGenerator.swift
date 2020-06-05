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
        
        
        
        return MathProblem(config: config, lhs: expression)
    }
    
    /**
     Generates a math problem based on the configuration.
     */
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
    
     
    
    
    
    /**
     This method generates a random number based on the contents of the config file
     It will either generate an int or a double with a specified precision
     */
    private func generateNumber(_ config: MathConfig) -> MathElement{
        if(config.allowDecimals){
            return .Decimal(value: Double.random(in: Double(config.minGenNumberValue) ... Double(config.maxGenNumberValue) ))
        } else {
            return .Integer(value: Int.random(in: config.minGenNumberValue ... config.maxGenNumberValue))
        }
    }
}
