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
    
    var allowedOperations = [MathOperation]()
    
    var allowDecimals : Bool
    var digitsAfterDecimal: Int
    
    var minGenNumberValue: Int = 0
    var maxGenNumberValue: Int = 999
    
    var numElementsLower : Int
    var numElementsUpper : Int
    
    init(problemAmount: Int, allowedOperations: [MathOperation], allowDecimals: Bool, digitsAfterDecimal: Int, numElementsLower: Int, numElementsUpper: Int){
        self.problemAmount = problemAmount
        self.allowedOperations = allowedOperations
        self.allowDecimals = allowDecimals
        self.digitsAfterDecimal = digitsAfterDecimal
        self.numElementsLower = numElementsLower
        self.numElementsUpper = numElementsUpper
    }
}
