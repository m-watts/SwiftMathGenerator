//
//  ResultSymbol.swift
//  mathGenerator
//
//  Created by Martin Watts on 31/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation


enum ResultSymbol : String {
    case equal
    case equalLessThan
    case equalGreaterThan
    case lessThan
    case greaterThan
    case notEqualTo
    
    
    var info: (printFormat: String, nsExpressionFormat: String) {
        switch self {
        case .equal: return ("=", "=")
        case .equalLessThan: return ("=<", "=<")
        case .equalGreaterThan: return (">=", ">=")
        case .lessThan: return ("<", "<")
        case .greaterThan: return (">", ">")
        case .notEqualTo: return ("=/=", "=/=")
        }
    }
    
    
    
}
