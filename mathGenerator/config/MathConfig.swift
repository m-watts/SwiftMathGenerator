//
//  MathConfig.swift
//  mathGenerator
//
//  Created by Martin Watts on 27/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation


struct MathConfig {
    
    var problemAmount : Int
    
    var allowedOperations = [Operation]()
    
    var allowDecimals : Bool
    var digitsAfterDecimal: Int
    
    var numElementsLower : Int
    var numElementsUpper : Int
    
}
