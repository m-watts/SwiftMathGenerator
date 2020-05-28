//
//  mathGenerator.swift
//  mathGenerator
//
//  Created by Martin Watts on 27/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

class MathGenerator : Generator {

    public func generateProblems(config: MathConfig) -> [MathExpression] {
        var problems = [MathExpression]()
        
        for i in 1...config.problemAmount {
            problems.append(generateProblem(config: config))
        }
        
        return problems
    }
    
    private func generateProblem(config: MathConfig) -> MathExpression {
        return MathExpression(lhs: .Integer(value: 1), rhs: .Integer(value: 2), operation: .addition)
    }
    
    
}
