//
//  CalculatorTest.swift
//  CalculatorTest
//
//  Created by 이영우 on 2021/04/03.
//

import XCTest
@testable import Calculator

class CalculatorTest: XCTestCase {

    private var decimal: DecimalCalculator!
    private var binary: BinaryCalculator!
    
    override func setUpWithError() throws {
        //매 testmethod가 실행될 때마다 실행되는 코드들
        decimal = DecimalCalculator()
        binary = BinaryCalculator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        decimal = nil
        binary = nil
    }
    
    func test_decimal_add() {
        decimal.input("2")
        decimal.input("+")
        decimal.input("3")
        decimal.input("=")
        guard let result = decimal.output() else { return }
        XCTAssertEqual(result, "5")
    }
    
    func test_decimal_subtract() {
        decimal.input("2")
        decimal.input("-")
        decimal.input("3")
        decimal.input("=")
        guard let result = decimal.output() else { return }
        XCTAssertEqual(result, "-1")
    }
    
    func test_decimal_multiply() {
        decimal.input("2")
        decimal.input("*")
        decimal.input("3")
        decimal.input("=")
        guard let result = decimal.output() else { return }
        XCTAssertEqual(result, "6")
    }
    
    func test_decimal_divide() {
        decimal.input("6")
        decimal.input("/")
        decimal.input("3")
        decimal.input("=")
        guard let result = decimal.output() else { return }
        XCTAssertEqual(result, "2")
    }
    
    func test_decimal_calculate() {
        decimal.input("2")
        decimal.input("*")
        decimal.input("3")
        decimal.input("+")
        decimal.input("=")
        decimal.input("=")
        guard let result = decimal.output() else { return }
        XCTAssertEqual(result, "18")
    }
    
    func test_binary_add() {
        binary.input("1")
        binary.input("0")
        binary.input("1")
        binary.input("+")
        binary.input("1")
        binary.input("1")
        binary.input("=")
        guard let result = binary.output() else { return }
        XCTAssertEqual(result, "1000")
    }
    
    func test_binary_subtract() {
        binary.input("1")
        binary.input("0")
        binary.input("1")
        binary.input("-")
        binary.input("1")
        binary.input("1")
        binary.input("=")
        guard let result = binary.output() else { return }
        XCTAssertEqual(result, "10")
    }
    
    func test_binary_and() {
        binary.input("1")
        binary.input("0")
        binary.input("1")
        binary.input("&")
        binary.input("1")
        binary.input("1")
        binary.input("=")
        guard let result = binary.output() else { return }
        XCTAssertEqual(result, "1")
    }
    
    func test_binary_or() {
        binary.input("1")
        binary.input("0")
        binary.input("1")
        binary.input("|")
        binary.input("1")
        binary.input("0")
        binary.input("0")
        binary.input("0")
        binary.input("=")
        guard let result = binary.output() else { return }
        XCTAssertEqual(result, "1101")
    }
}
