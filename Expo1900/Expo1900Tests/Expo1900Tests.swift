//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 이영우 on 2021/04/06.
//

import XCTest
import Foundation
@testable import Expo1900

class Expo1900Tests: XCTestCase {

    var decoder: JSONDecoder!
    private let itemJson: String = "items"
    private let expoJson: String = "exposition_universelle_1900"
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        decoder = JSONDecoder()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        decoder = nil
    }

    func test_만국박람회_exposition_디코더_확인() {
        guard let assetData = NSDataAsset(name: expoJson) else {
            XCTFail()
            return
        }
        _ = try! decoder.decode(Exposition.self, from: assetData.data)
    }
    
    func test_만국박람회_한국출품작_디코더_확인() {
        guard let assetData = NSDataAsset(name: expoJson) else {
            XCTFail()
            return
        }
        _ = try! decoder.decode(Exposition.self, from: assetData.data)
    }
}
