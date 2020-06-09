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
        return .Decimal(value: Double.random(in: Double(config.minGenNumberValue).rounded(toPlaces: config.digitsAfterDecimal) ... Double(config.maxGenNumberValue).rounded(toPlaces: config.digitsAfterDecimal) ))
    } else {
        return .Integer(value: Int.random(in: config.minGenNumberValue ... config.maxGenNumberValue))
    }
}

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
