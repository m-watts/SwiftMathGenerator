//
//  MathProblem.swift
//  mathGenerator
//
//  Created by Martin Watts on 27/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation


class MathExpression : CustomStringConvertible {
    //var terms: [MathTerm]
    var lhs: MathElement
    var rhs: MathElement
    var operation: MathOperation
    var parenthesis: Bool
    
    
    init(lhs: MathElement, rhs: MathElement, operation: MathOperation, parenthesis: Bool = false) {
        self.lhs = lhs
        self.rhs = rhs
        self.operation = operation
        self.parenthesis = parenthesis
    }
    
    var description: String {
        let leftString = formatTerm(element: lhs)
        let rightString = formatTerm(element: rhs)
        
        return "\(leftString) \(self.operation.info.printFormat) \(rightString)"
    }
    
    var nsExpressionFormat : String {
        let leftString = formatTerm(element: lhs, nsExpressionFormat: true)
        let rightString = formatTerm(element: rhs, nsExpressionFormat: true)
        return "\(leftString) \(operation.info.nsExpressionFormat) \(rightString)"

    }
    
    var result : Any? {
        let leftString = formatTerm(element: lhs, nsExpressionFormat: true)
        let rightString = formatTerm(element: rhs, nsExpressionFormat: true)
        let format = "\(leftString) \(operation.info.nsExpressionFormat) \(rightString)"
        let expr = NSExpression(format: format)
        return expr.expressionValue(with: nil, context: nil)
    }
    
    private func formatTerm(element: MathElement, nsExpressionFormat: Bool = false) -> String {
        var formattedTerm = ""
        
        if case .Expression(let expression) = element{
            
            
            formattedTerm = nsExpressionFormat ? expression.nsExpressionFormat : expression.description
            
            if expression.parenthesis {
                formattedTerm = "(\(formattedTerm))"
            }
        } else {
            formattedTerm = nsExpressionFormat ? element.nsExpressionFormatString : element.description
        }
        
        return formattedTerm
    }
}
