//
//  MathProblem.swift
//  mathGenerator
//
//  Created by Martin Watts on 27/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation


class MathExpression : CustomStringConvertible {
    var lhs: MathElement
    var rhs: MathElement
    var operation: Operation
    
    
    init(lhs: MathElement, rhs: MathElement, operation: Operation) {
        self.lhs = lhs
        self.rhs = rhs
        self.operation = operation
    }
    
    var description: String {
        var leftString = ""
        var rightString = ""

        if case .Expression(_) = lhs{
            leftString = "(\(lhs))"
        } else {
            leftString = lhs.description
        }
        if case .Expression(_) = rhs {
            rightString = "(\(rhs))"
        } else {
            rightString = rhs.description
        }
        
        return "\(leftString) \(self.operation.rawValue) \(rightString)"
    }
    
    var result : Any? {
        let format = "\(lhs.nsExpressionFormatString) \(operation.rawValue) \(rhs.nsExpressionFormatString)"
        let expr = NSExpression(format: format)
        return expr.expressionValue(with: nil, context: nil)
    }
}
