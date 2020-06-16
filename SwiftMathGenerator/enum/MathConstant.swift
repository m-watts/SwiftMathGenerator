//
//  MathConstants.swift
//  SwiftMathGenerator
//
//  Created by Martin Watts on 15/06/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation

enum MathConstant: CustomStringConvertible {
    
    case pi
    
    
    var info : (printFormat: String, nsExpressionFormat: String) {
        switch self {
            case .pi: return("π", "\(Double.pi)")
        }
    }
    
    var description: String {
        return self.info.printFormat
    }
}
