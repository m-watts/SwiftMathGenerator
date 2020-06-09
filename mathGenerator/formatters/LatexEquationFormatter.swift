//
//  LatexEquationFormatter.swift
//  mathGenerator
//
//  Created by Martin Watts on 08/06/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation


struct LatexEquationFormatter : MathFormatter {
    
    
    func format(problem: MathProblem) -> String {
        let r = problem.resultSymbol != nil ? " \(problem.resultSymbol!) " : ""
        let rhs = problem.rhs != nil ? "\(problem.rhs!)" : ""
        return "\(problem.lhs)\(r)\(rhs)"
    }
}
