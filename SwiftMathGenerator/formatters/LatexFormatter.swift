//
//  LatexEquationFormatter.swift
//  mathGenerator
//
//  Created by Martin Watts on 08/06/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation


struct LatexFormatter : MathFormatter {
    
    
    func format(problem: MathProblem) -> String {
        let lhs = formatElement(problem.lhs)
        let r = problem.resultSymbol != nil ? formatSymbol(problem.resultSymbol!) : ""
        let rhs = problem.rhs != nil ? formatElement(problem.rhs!) : ""
                
        return "\(lhs)\(r)\(rhs)"
    }
    
    private func formatElement(_ element: MathElement) -> String{
        switch element {
        case .Expression(let expr):
            return formatExpression(expr)
        case .Constant(let constant):
            return formatConstant(constant)
        default:
            return "\(element)"
        }
    }
    
    private func formatExpression(_ expression: MathExpression) -> String {
        let lhs = formatElement(expression.lhs)
        let rhs = formatElement(expression.rhs)
        
        let o = formatSymbol(expression.operation)
       
        let e = o
        .replacingOccurrences(of: "{0}", with: lhs)
        .replacingOccurrences(of: "{1}", with: rhs)
        
        if expression.parenthesis {
            return "(\(e)"
        } else {
            return e
        }
    }
    
    private func formatSymbol(_ resultSymbol: ResultSymbol) -> String {
        switch resultSymbol {
        case .equal:
            return "="
        case .greaterThanOrEqual:
            return "\\geq"
        case .lessThanOrEqual:
            return "\\leq"
        case .greaterThan:
            return ">"
        case .lessThan:
            return "<"
        case .notEqualTo:
            return "\\neq"
        default:
            return "\(resultSymbol)"
        }
        
        
    }
    
    private func formatSymbol(_ operation: MathOperation) -> String {
        switch operation {
        case .fraction:
            return "\\frac{{0}}{{1}}"
        default:
            return "{0}\(operation){1}"
        }
    }
    
    private func formatConstant(_ constant: MathConstant) -> String {
        switch constant {
        case .pi:
            return "\\pi"
        default:
            return "\(constant)"
        }
        
    }
}
