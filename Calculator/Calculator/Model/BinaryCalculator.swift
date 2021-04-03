//
//  BinaryCalculator.swift
//  Calculator
//
//  Created by 이영우 on 2021/03/22.
//

import Foundation

final class BinaryCalculator: Calculatable {
    private var operatorStack: Stack = Stack<String>()
    private var postfixNumbers = [String]()
    private var operandBuffer = String.blank
    private let operators = BinaryOperatorType.allCases.map{ $0.rawValue }
    private var isInputedOperator = false
    
    //MARK: - Calculatable 프로토콜의 메서드
    func input(_ input: String) {
        if operators.contains(input) == false {
            inputNumber(input)
        } else if input == "~" {
            inputNot()
        } else if input == "=" {
            inputEqual()
        } else {
            inputOperator(input)
        }
    }
    
    func output() -> String? {
        guard let top = operatorStack.peek() else { return String.zero }
        return top
    }
    
    func reset() {
        operatorStack.reset()
        postfixNumbers.removeAll()
        operandBuffer = String.blank
    }
    
    //MARK: - input 관련 method
    private func inputNumber(_ input: String) {
        operandBuffer = operandBuffer + input
        isInputedOperator = false
    }
    
    private func inputOperator(_ input: String) {
        if isInputedOperator == false {
            postfixNumbers.append(operandBuffer)
            operandBuffer = String.blank
            moveHigherPrioritythan(input)
            pushOperatorInStack(input)
            isInputedOperator = true
        } else {
            _ = operatorStack.pop()
            moveHigherPrioritythan(input)
            pushOperatorInStack(input)
            isInputedOperator = true
        }
    }
    
    private func inputNot() {
        guard let number = UInt8(operandBuffer, radix: Int.binary) else { return }
        operandBuffer = String(~number, radix: Int.binary)
        isInputedOperator = false
    }
    
    private func inputEqual() {
        postfixNumbers.append(operandBuffer)
        operandBuffer = String.blank
        moveAllToPostfixNumbers()
        for _ in Int.zero..<postfixNumbers.count {
            let postfixElement = postfixNumbers.removeFirst()
            calculate(currentOperator: postfixElement)
        }
    }
    
    private func calculate(currentOperator: String) {
        if !operators.contains(currentOperator) {
            operatorStack.push(currentOperator)
            return
        }
        
        guard let stackFirst = operatorStack.pop() else { return }
        guard let numberFirst = UInt8(stackFirst, radix: Int.binary) else { return }
        
        guard let stackSecond = operatorStack.pop() else { return }
        guard let numberSecond = UInt8(stackSecond, radix: Int.binary) else { return }
        
        let result = infixCalculate(firstNumber: numberFirst, operatorSymbol: currentOperator, secondNumber: numberSecond)
        operatorStack.push(result)
    }
    
    private func infixCalculate(firstNumber: UInt8, operatorSymbol: String, secondNumber: UInt8) -> String {
        let error: Error = CalculatorError.invalidOperator
        
        switch operatorSymbol {
        case BinaryOperatorType.subtract.symbol:
            return subtract(firstNumber: firstNumber, secondNumber: secondNumber)
        case BinaryOperatorType.add.symbol:
            return add(firstNumber: firstNumber, secondNumber: secondNumber)
        case BinaryOperatorType.or.symbol:
            return or(firstNumber: firstNumber, secondNumber: secondNumber)
        case BinaryOperatorType.nor.symbol:
            return nor(firstNumber: firstNumber, secondNumber: secondNumber)
        case BinaryOperatorType.and.symbol:
            return and(firstNumber: firstNumber, secondNumber: secondNumber)
        case BinaryOperatorType.nand.symbol:
            return nand(firstNumber: firstNumber, secondNumber: secondNumber)
        case BinaryOperatorType.xor.symbol:
            return xor(firstNumber: firstNumber, secondNumber: secondNumber)
        case BinaryOperatorType.leftShift.symbol:
            return leftShift(firstNumber: firstNumber, secondNumber: secondNumber)
        case BinaryOperatorType.rightShift.symbol:
            return rightShift(firstNumber: firstNumber, secondNumber: secondNumber)
        default:
            print(error.localizedDescription)
            fatalError()
        }
    }
    
    //MARK: - 중위연산 수행하는 method
    private func add(firstNumber: UInt8, secondNumber: UInt8) -> String {
        var result: UInt8 = UInt8.zero
        result = secondNumber + firstNumber
        return String(result, radix: Int.binary)
    }
    
    private func subtract(firstNumber: UInt8, secondNumber: UInt8) -> String {
        var result: UInt8 = UInt8.zero
        result = secondNumber - firstNumber
        return String(result, radix: Int.binary)
    }
    
    private func or(firstNumber: UInt8, secondNumber: UInt8) -> String {
        var result: UInt8 = UInt8.zero
        result = secondNumber | firstNumber
        return String(result, radix: Int.binary)
    }
    
    private func nor(firstNumber: UInt8, secondNumber: UInt8) -> String {
        var result: UInt8 = UInt8.zero
        result = ~(secondNumber | firstNumber)
        return String(result, radix: Int.binary)
    }
    
    private func xor(firstNumber: UInt8, secondNumber: UInt8) -> String {
        var result: UInt8 = UInt8.zero
        result = secondNumber ^ firstNumber
        return String(result, radix: Int.binary)
    }
    
    private func and(firstNumber: UInt8, secondNumber: UInt8) -> String {
        var result: UInt8 = UInt8.zero
        result = secondNumber & firstNumber
        return String(result, radix: Int.binary)
    }
    
    private func nand(firstNumber: UInt8, secondNumber: UInt8) -> String {
        var result: UInt8 = UInt8.zero
        result = ~(secondNumber & firstNumber)
        return String(result, radix: Int.binary)
    }
    
    private func leftShift(firstNumber: UInt8, secondNumber: UInt8) -> String {
        var result: UInt8 = UInt8.zero
        result = secondNumber << firstNumber
        return String(result, radix: Int.binary)
    }
    
    private func rightShift(firstNumber: UInt8, secondNumber: UInt8) -> String {
        var result: UInt8 = UInt8.zero
        result = secondNumber >> firstNumber
        return String(result, radix: Int.binary)
    }
    
    //MARK: - stack, array로 이동하게하는 methods
    private func pushOperatorInStack(_ input: String) {
        operatorStack.push(input)
    }
    
    private func moveAllToPostfixNumbers() {
        for _ in Int.zero..<operatorStack.count {
            guard let stackTop = operatorStack.pop() else { return }
            postfixNumbers.append(stackTop)
        }
    }
    
    //MARK: - priority에 따른 처리 담당 method
    private func moveHigherPrioritythan(_ input: String) {
        guard let inputPriority = BinaryOperatorType(rawValue: input)?.priority else { return }
        
        for _ in Int.zero..<operatorStack.count {
            guard let stackTop = operatorStack.peek() else { return }
            guard let stackTopOperatorType = BinaryOperatorType(rawValue: stackTop) else { return }
            if inputPriority <= stackTopOperatorType.priority {
                guard let value = operatorStack.pop() else { return }
                postfixNumbers.append(value)
            } else {
                postfixNumbers.append(input)
                break
            }
        }
    }
}
