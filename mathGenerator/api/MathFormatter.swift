//
//  MathFormatter.swift
//  mathGenerator
//
//  Created by Martin Watts on 31/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation

protocol MathFormatter {
    
    func format(problem: MathProblem) -> String
    
}
