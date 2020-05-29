//
//  MathConfig.swift
//  mathGenerator
//
//  Created by Martin Watts on 27/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation


class MathConfig {
    
    var problemAmount : Int
    
    var allowedOperations = [Operation]()
    
    var allowDecimals : Bool
    var digitsAfterDecimal: Int
    
    var numElementsLower : Int
    var numElementsUpper : Int
    
    init(problemAmount: Int, allowedOperations: [Operation], allowDecimals: Bool, digitsAfterDecimal: Int, numElementsLower: Int, numElementsUpper: Int){
        self.problemAmount = problemAmount
        self.allowedOperations = allowedOperations
        self.allowDecimals = allowDecimals
        self.digitsAfterDecimal = digitsAfterDecimal
        self.numElementsLower = numElementsLower
        self.numElementsUpper = numElementsUpper
    }
}
