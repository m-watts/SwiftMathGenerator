//
//  MathProblem.swift
//  mathGenerator
//
//  Created by Martin Watts on 31/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation

class MathProblem : CustomStringConvertible {
    var lhs: MathExpression
    var rhs: MathExpression?
    var resultSymbol: ResultSymbol?
    
    var type: MathProblemType = .expression
    var details: MathConfig
    
    init(config: MathConfig,
         lhs: MathExpression,
         rhs: MathExpression? = nil,
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
        let rhs = self.rhs != nil ? "\(self.rhs!.nsExpressionFormat)" : ""
        return "\(lhs.nsExpressionFormat)\(r)\(rhs)"
        
    }
    
    var result : Any? {
        if let r = rhs {
            return r.description
        }
        let format = lhs.nsExpressionFormat
        let expr = NSExpression(format: format)
        return expr.expressionValue(with: nil, context: nil)
    }
}