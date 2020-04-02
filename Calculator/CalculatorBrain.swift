//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum OperatorType: String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "×"
    case division = "÷"
}

class CalculatorBrain {
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    func addOperandDigit(_ digit: String) -> String {
        if operatorType == nil {
            operand1String += digit
            return operand1String
        } else {
            operand2String += digit
            return operand2String
        }
    }
    
    func setOperator(_ operatorString: String) {
        operatorType = OperatorType(rawValue: operatorString)
    }
    
    func calculateIfPossible() -> String? {
        if let currentOp = operatorType,
            let operand1 = Double(operand1String),
            let operand2 = Double(operand2String) {
            
            var ans: Double
            
            switch currentOp {
            case .subtraction:
                ans = operand1 - operand2
            case .addition:
                ans = operand1 + operand2
            case .multiplication:
                ans = operand1 * operand2
            case .division:
                if operand2 == 0 {
                    return "Error"
                } else {
                    ans = operand1 / operand2
                }
            }
            
            return String(ans)
            
            
        } else {
            return nil
        }
    }
}
