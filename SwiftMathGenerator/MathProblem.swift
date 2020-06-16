//
//  MathProblem.swift
//  mathGenerator
//
//  Created by Martin Watts on 31/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation

class MathProblem : CustomStringConvertible {
    var lhs: MathElement
    var rhs: MathElement?
    var resultSymbol: ResultSymbol?
    
    var type: MathProblemType = .expression
    var details: MathConfig
    
    init(config: MathConfig,
         lhs: MathElement,
         rhs: MathElement? = nil,
         resultSymbol: ResultSymbol? = nil
    ){
        self.lhs = lhs
        self.rhs = rhs
        self.resultSymbol = resultSymbol
        self.details = config
    }
    
    var description: String {
        
        if let f = details.formatter {
            return f.format(problem: self)
        } else {
            let r = resultSymbol != nil ? " \(resultSymbol!) " : ""
            let rhs = self.rhs != nil ? "\(self.rhs!)" : ""
            return "\(lhs)\(r)\(rhs)"
        }
    }
    
    var nsExpressionFormat : String {
        let r = resultSymbol != nil ? " \(resultSymbol!.info.nsExpressionFormat) " : ""
        let rhs = self.rhs != nil ? "\(self.rhs!.nsExpressionFormatString)" : ""
        return "\(lhs.nsExpressionFormatString)\(r)\(rhs)"
        
    }
    
    var result : String {
        if let r = rhs {
            return r.description
        }
        let format = lhs.nsExpressionFormatString
        let expr = NSExpression(format: format)
        let result = expr.expressionValue(with: nil, context: nil)
        
        if let r = result {
            let d : Double = (r as! Double).rounded(toPlaces: self.details.digitsAfterDecimal)
            
            let isInteger = floor(d) == d
            
            if isInteger {
                return String(Int(d))
            } else {
                return String(d)
            }
        }
        
        return "unknown"
    }
}
