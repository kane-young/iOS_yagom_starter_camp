//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias FruitCount = [Fruit: FruitInformation]

struct FruitInformation {
    var count: Int
}

enum Fruit {
    case strawberry, banana, pineapple, kiwi, mango
}

enum Juice {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangokiwi
    
    var name: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .kiwi:
            return "키위"
        case .pineapple:
            return "파인애플"
        case .strawberryBanana:
            return "딸바"
        case .mango:
            return "망고"
        case .mangokiwi:
            return "망키"
        }
    }
    var recipe: FruitCount {
        switch self {
        case .strawberry:
            return [.strawberry: FruitInformation(count: 16)]
        case .banana:
            return [.banana: FruitInformation(count: 2)]
        case .kiwi:
            return [.kiwi: FruitInformation(count: 3)]
        case .pineapple:
            return [.pineapple: FruitInformation(count: 2)]
        case .strawberryBanana:
            return [.strawberry: FruitInformation(count: 10), .banana: FruitInformation(count: 1)]
        case .mango:
            return [.mango: FruitInformation(count: 3)]
        case .mangokiwi:
            return [.mango: FruitInformation(count: 2), .kiwi: FruitInformation(count: 1)]
        }
    }
}

enum JuiceMakerError: Error {
    case outOfStock, notFoundFruit
}

struct FruitStock {
    private var remainedFruit: FruitCount
    
    init(initialCount: Int) {
        remainedFruit = [.strawberry: FruitInformation(count: initialCount), .banana: FruitInformation(count: initialCount), .kiwi: FruitInformation(count: initialCount), .pineapple: FruitInformation(count: initialCount), .mango: FruitInformation(count: initialCount)]
    }
    
    mutating func addStock(of fruit: Fruit, count: Int) {
        if let storedFruit = remainedFruit[fruit] {
            remainedFruit[fruit]?.count = storedFruit.count + count
        }
    }

    mutating func subtractStock(of fruit: Fruit, count: Int) {
        if let storedFruit = remainedFruit[fruit] {
            remainedFruit[fruit]?.count = storedFruit.count - count
        }
    }
    
    mutating func changeStock(of fruit: Fruit, count: Int) {
        if let _ = remainedFruit[fruit] {
            remainedFruit[fruit]?.count = count
        }
    }
    
    func readCount(of fruit: Fruit) -> Int {
        if let storedFruit = remainedFruit[fruit] {
            return storedFruit.count
        } else {
            return 0
        }
    }
}

class JuiceMaker {
    var stock: FruitStock = FruitStock(initialCount: 10)
    static let shared = JuiceMaker()
    
    private init() { }
    
    func makeJuice(using juice: Juice) throws {
        for (ingredient, information) in juice.recipe {
            guard stock.readCount(of: ingredient) >= information.count else {
                throw JuiceMakerError.outOfStock
            }
        }
        
        for (ingredient, information) in juice.recipe {
            guard stock.readCount(of: ingredient) >= information.count else {
                throw JuiceMakerError.outOfStock
            }
            
            stock.subtractStock(of: ingredient, count: information.count)
        }
    }
    
    func readStock(of fruit: Fruit) -> Int {
        return stock.readCount(of: fruit)
    }
}
