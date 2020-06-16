//
//  MathElement.swift
//  mathGenerator
//
//  Created by Martin Watts on 27/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation

enum MathElement : CustomStringConvertible {
    case Integer(_ value: Int)
    case Decimal(_ value: Double)
    case Percentage(_ value: Int)
    case Expression(_ expression: MathExpression)
    case Variable(_ term: String, coefficient: Double?)
    case Constant(_ value: MathConstant)
    
    var description: String {
        switch self {
        case .Integer(let value): return "\(value)"
        case .Decimal(let value): return "\(value)"
        case .Percentage(let percentage): return "\(percentage)%"
        case .Expression(let expr): return expr.description
        case .Variable(let variable, let coefficient): return formatVariable(variable: variable, coefficient: coefficient)
        case .Constant(let value): return "\(value.info.printFormat)"
        }
    }
    
    
    
    var nsExpressionFormatString : String {
        switch self {
        case .Integer(let value): return "\(value).0"
        case .Decimal(let value): return "\(value)"
        case .Percentage(let percentage): return "\(Double(percentage) / 100)"
        case .Expression(let expr): return "\(expr.description)"
        case .Variable(let variable, let coefficient): return formatVariable(variable: variable, coefficient: coefficient)
        case .Constant(let value): return "\(value.info.nsExpressionFormat)"
        }
    }
    
    func formatVariable(variable: String, coefficient: Double?) -> String{
        var formattedString = variable
        
        if let c = coefficient {
            formattedString = "\(c)\(formattedString)"
        }
        
        return formattedString
    }
    
}
