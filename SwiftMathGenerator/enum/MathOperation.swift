//
//  Operator.swift
//  mathGenerator
//
//  Created by Martin Watts on 27/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation

enum MathOperation : CustomStringConvertible {
    //Case can be none for first element in expression
    case none
    
    //Simple operations
    case addition
    case subtraction
    case multiplication
    case division
    case exponent
    
    //Special operations
    case fraction
    case parenthesis
    case percent
    case root
    
    
    var info : (printFormat: String, nsExpressionFormat: String) {
        switch self {
        case .none: return("","")
        case .addition: return ("+", "+")
        case .subtraction: return ("-", "-")
        case .multiplication: return ("*", "*")
        case .division: return ("/", "/")
        case .parenthesis: return ("()", "()")
        case .exponent: return ("^", "**")
        case .percent: return ("%", "%")
        case .root: return("√", "sqrt")
        case .fraction: return("/","/")
        }
    }
    
    var description: String {
        return self.info.printFormat
    }
    
}
