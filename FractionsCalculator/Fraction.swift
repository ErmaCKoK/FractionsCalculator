//
//  Fraction.swift
//  FractionsCalculator
//
//  Created by Andrii Kurshyn on 6/25/19.
//  Copyright © 2019 Andrii Kurshyn. All rights reserved.
//

import Foundation

//Greatest Common Divisor
func gcd(_ a: Int, _ b: Int) -> Int {
    return a != 0 ? gcd(b % a, a) : b
}

struct Fraction: CustomStringConvertible {
    var numerator: Int
    var denominator: Int
    
    init(numerator: Int, denominator: Int) {
        let divisor = abs(gcd(numerator, denominator))
        self.numerator = numerator / divisor
        self.denominator = denominator / divisor
    }
    
    init(number: Int, numerator: Int, denominator: Int) {
        let numerator = (number * denominator) + numerator
        self.init(numerator: numerator, denominator: denominator)
    }
    
    init(number: Int) {
        self.numerator = number
        self.denominator = 1
    }
    
    var description: String {
        
        var number = abs(numerator / self.denominator)
        var numberString = ""
        var numerator = self.numerator
        if number >= 1 {
            if numerator < 0 {
                number = number * -1
            }
            numerator = abs(numerator % self.denominator)
            
            numberString = "\(number)_"
        }
        
        if numerator == 0 {
            return "\(number)"
        }
        
        return "\(numberString)\(numerator)/\(self.denominator)"
    }
}

// MARK: - Fraction from string

extension Fraction {
    
    init?(with string: String) {
        let numbersOfFraction =  string.components(separatedBy: "/")
        
        let numbers = numbersOfFraction.first?.components(separatedBy: "_") ?? []
        
        let number: Int? = numbers.count > 1 ? Int(numbers.first ?? "") : nil
        guard let numerator = Int(numbers.last ?? "") else { return nil }
        
        if numbersOfFraction.count == 1 {
            if numbers.count > 1 {  return nil }
            self.init(number: numerator)
            return
        }
        
        guard let denominator = Int(numbersOfFraction.last ?? "") else { return nil }
        
        self.init(number: number ?? 0, numerator: numerator, denominator: denominator)
    }
    
}

// MARK: - Operations

extension Fraction {
    
    static func +(lhs: Fraction, rhs: Fraction) -> Fraction {
        let numerator = lhs.numerator * rhs.denominator + rhs.numerator * lhs.denominator
        let denominator = lhs.denominator * rhs.denominator
        
        return Fraction(numerator: numerator, denominator: denominator)
    }
    
    static func -(lhs: Fraction, rhs: Fraction) -> Fraction {
        let numerator = lhs.numerator * rhs.denominator - rhs.numerator * lhs.denominator
        let denominator = lhs.denominator * rhs.denominator
        
        return Fraction(numerator: numerator, denominator: denominator)
    }
    
    static func *(lhs: Fraction, rhs: Fraction) -> Fraction {
        let numerator = lhs.numerator * rhs.numerator
        let denominator = lhs.denominator * rhs.denominator
        
        return Fraction(numerator: numerator, denominator: denominator)
    }
    
    static func /(lhs: Fraction, rhs: Fraction) -> Fraction {
        let numerator = lhs.numerator * rhs.denominator
        let denominator = lhs.denominator * rhs.numerator
        
        return Fraction(numerator: numerator, denominator: denominator)
    }
}

