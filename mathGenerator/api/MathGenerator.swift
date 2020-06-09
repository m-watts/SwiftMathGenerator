//
//  Generator.swift
//  mathGenerator
//
//  Created by Martin Watts on 27/05/2020.
//  Copyright © 2020 Martin Watts. All rights reserved.
//

import Foundation

protocol MathGenerator {
    
    func generateProblems(config: MathConfig) -> [MathProblem]
}
