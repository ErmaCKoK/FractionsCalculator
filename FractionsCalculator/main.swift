//
//  main.swift
//  FractionsCalculator
//
//  Created by Andrii Kurshyn on 6/25/19.
//  Copyright © 2019 Andrii Kurshyn. All rights reserved.
//

import Foundation


let console = Console()

console.message("Welcome to FractionsCalculator! Format fraction 1_2/3. For quit type 'q'.")

var shouldQuit = false
while !shouldQuit {
    
    console.message("Type a expression:")
    
    let input = console.getInput()
    if input == "q" {
        shouldQuit = true
        continue
    }
    
    let expressions = input.components(separatedBy: .whitespacesAndNewlines).filter({ !$0.isEmpty })
    
    if expressions.count < 2 {
        console.error("Expression should be contained more than 1 operand")
        continue
    }
    
    guard var fraction = Fraction(with: expressions[0]) else {
        console.error("Can not read fraction '\(expressions[0])'")
        continue
    }
    
    for i in stride(from: 1, to: expressions.count, by: 2) {
        let operation = expressions[i]
        
        if i+1 >= expressions.count { break }
        
        guard let second = Fraction(with: expressions[i+1]) else {
            console.error("Can not read fraction '\(expressions[i+1])'")
            break
        }
        
        switch operation {
        case "+":
            fraction = fraction + second
            
        case "-":
            fraction = fraction - second
            
        case "*":
            fraction = fraction * second
            
        case "/":
            fraction = fraction / second
            
        default:
            console.error("Skipped unknown operation '\(operation)'")
            break
        }
    }
    
    console.message("= \(fraction)")
}

