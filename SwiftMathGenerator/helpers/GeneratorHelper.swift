//
//  generatorHelper.swift
//  mathGenerator
//
//  Created by Martin Watts on 08/06/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation


/**
 This method generates a random number based on the contents of the config file
 It will either generate an int or a double with a specified precision
 */
func generateNumber(_ config: MathConfig) -> MathElement {
    if(config.allowDecimals){
        return .Decimal(Double.random(in: Double(config.minGenNumberValue).rounded(toPlaces: config.digitsAfterDecimal) ... Double(config.maxGenNumberValue).rounded(toPlaces: config.digitsAfterDecimal) ))
    } else {
        return .Integer(Int.random(in: config.minGenNumberValue ... config.maxGenNumberValue))
    }
}

/**
 Selects a random Operation (eg. + -  / ) based on allowed operations on the config object
 Uses the weight on each operation to determine the chance of selecting an operation
 
 Eg. [O(+ , 1 ) , O(- , 2)] means a 2/3 chance of subtraction being selected.
 */
func randomOperation(_ config: MathConfig) -> MathOperation {
    let sumOfWeights = config.allowedOperations.map({ $0.weight }).reduce(0, +)
    
    let position = Int.random(in: 1 ... sumOfWeights)
    
    var sum = 0
    var operation : MathOperation?
    
    for o in config.allowedOperations {
        sum += o.weight
        if position <= sum {
            operation = o.operation
            break
        }
    }
    
    return operation!
}
