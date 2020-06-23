//
//  ResultSymbol.swift
//  mathGenerator
//
//  Created by Martin Watts on 31/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation


enum ResultSymbol {
    case equal
    case lessThanOrEqual
    case greaterThanOrEqual
    case lessThan
    case greaterThan
    case notEqualTo
    
    
    var info: (printFormat: String, nsExpressionFormat: String) {
        switch self {
        case .equal: return ("=", "=")
        case .lessThanOrEqual: return ("=<", "=<")
        case .greaterThanOrEqual: return (">=", ">=")
        case .lessThan: return ("<", "<")
        case .greaterThan: return (">", ">")
        case .notEqualTo: return ("=/=", "=/=")
        }
    }
}

extension ResultSymbol: CustomStringConvertible {
    
    var description: String {
        return self.info.printFormat
    }
}
