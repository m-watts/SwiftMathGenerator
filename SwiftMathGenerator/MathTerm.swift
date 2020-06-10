//
//  MathTerm.swift
//  mathGenerator
//
//  Created by Martin Watts on 5/28/20.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation

class MathTerm : CustomStringConvertible {
    var operation: MathOperation
    
    
    init(operation: MathOperation){
        self.operation = operation
    }
    
    var description: String {
        return "TEST"
    }
}
