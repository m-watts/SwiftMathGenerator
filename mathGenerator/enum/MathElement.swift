//
//  MathElement.swift
//  mathGenerator
//
//  Created by Martin Watts on 27/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation

enum MathElement : CustomStringConvertible {
    case Integer(value: Int)
    case Decimal(value: Double)
    case Percentage(value: Int)
    case Expression(expression: MathExpression)
    //case Term(term: MathTerm)
    
    var description: String {
        switch self {
        case .Integer(let value): return "\(value)"
        case .Decimal(let value): return "\(value)"
        case .Percentage(let percentage): return "\(percentage)%"
        case .Expression(let expr): return expr.description
        }
    }
    
    
    
    var nsExpressionFormatString : String {
        switch self {
        case .Integer(let value): return "\(value).0"
        case .Decimal(let value): return "\(value)"
        case .Percentage(let percentage): return "\(Double(percentage) / 100)"
        case .Expression(let expr): return "\(expr.description)"
        }
    }
    
}
