//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    //MARK:-- @IBOutlet Properties
    
    @IBOutlet private weak var strawberryCountLabel: UILabel!
    @IBOutlet private weak var bananaCountLabel: UILabel!
    @IBOutlet private weak var pineappleCountLabel: UILabel!
    @IBOutlet private weak var kiwiCountLabel: UILabel!
    @IBOutlet private weak var mangoCountLabel: UILabel!
    
    @IBOutlet private weak var orderStrawberryBananaJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderStrawberryJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderBananaJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderPineappleJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderMangoKiwiJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderKiwiJuiceButton: OrderJuiceButton!
    @IBOutlet private weak var orderMangoJuiceButton: OrderJuiceButton!
    
    //MARK:-- Override function

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateFruitStock), name: Notification.Name(rawValue: "setStock"), object: nil)

        initializeButtons()
    }
    
    //MARK:-- @IBAction Function

    @IBAction private func moveStock(_ sender: Any) {
        guard let stockVC = self.storyboard?.instantiateViewController(identifier: JuiceMakerConstant.stockVC) else {
            return
        }

        self.present(stockVC, animated: false, completion: nil)
    }
    
    @IBAction private func orderJuice(_ sender: OrderJuiceButton) {
        guard let juice = sender.juice else {
            return
        }
        let alert = sender.make(using: juice)
        self.present(alert, animated: true, completion: nil)
        updateFruitStock()
    }

    //MARK:-- function

    private func initializeButtons() {
        orderStrawberryJuiceButton.juice = .strawberry
        orderBananaJuiceButton.juice = .banana
        orderStrawberryBananaJuiceButton.juice = .strawberryBanana
        orderKiwiJuiceButton.juice = .kiwi
        orderMangoJuiceButton.juice = .mango
        orderMangoKiwiJuiceButton.juice = .mangokiwi
        orderPineappleJuiceButton.juice = .pineapple
    }
    
    @objc private func updateFruitStock() {
        strawberryCountLabel.text = String(JuiceMaker.shared.readStock(of: .strawberry))
        bananaCountLabel.text = String(JuiceMaker.shared.readStock(of: .banana))
        kiwiCountLabel.text = String(JuiceMaker.shared.readStock(of: .kiwi))
        pineappleCountLabel.text = String(JuiceMaker.shared.readStock(of: .pineapple))
        mangoCountLabel.text = String(JuiceMaker.shared.readStock(of: .mango))
    }
}

