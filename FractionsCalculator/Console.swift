//
//  Console.swift
//  FractionsCalculator
//
//  Created by Andrii Kurshyn on 6/25/19.
//  Copyright © 2019 Andrii Kurshyn. All rights reserved.
//

import Foundation

class Console {
    
    func message(_ message: String) {
        print("\u{001B}[;m\(message)")
    }
    
    func error(_ message: String) {
        print("\u{001B}[0;31m\(message)")
    }

    func getInput() -> String {
        
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
    
}
