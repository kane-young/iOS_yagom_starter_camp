//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 이영우 on 2021/03/19.
//

import UIKit

class StockViewController: UIViewController {
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeLabel()
        initializeStepper()
    }
    
    @IBAction func touchUpClosedButton(_ sender: Any) {
        JuiceMaker.shared.stock.changeStock(of: .strawberry, count: Int(strawberryStepper.value))
        JuiceMaker.shared.stock.changeStock(of: .banana, count: Int(bananaStepper.value))
        JuiceMaker.shared.stock.changeStock(of: .mango, count: Int(mangoStepper.value))
        JuiceMaker.shared.stock.changeStock(of: .kiwi, count: Int(kiwiStepper.value))
        JuiceMaker.shared.stock.changeStock(of: .pineapple, count: Int(pineappleStepper.value))
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "setStock"), object: nil)
        
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func changeStock(_ sender: UIStepper) {
        switch sender.tag {
        case 0:
            strawberryStockLabel.text = String(Int(sender.value))
        case 1:
            bananaStockLabel.text = String(Int(sender.value))
        case 2:
            pineappleStockLabel.text = String(Int(sender.value))
        case 3:
            kiwiStockLabel.text = String(Int(sender.value))
        default:
            mangoStockLabel.text = String(Int(sender.value))
        }
    }
    
    func initializeLabel() {
        strawberryStockLabel.text = String(JuiceMaker.shared.readStock(of: .strawberry))
        bananaStockLabel.text = String(JuiceMaker.shared.readStock(of: .banana))
        kiwiStockLabel.text = String(JuiceMaker.shared.readStock(of: .kiwi))
        pineappleStockLabel.text = String(JuiceMaker.shared.readStock(of: .pineapple))
        mangoStockLabel.text = String(JuiceMaker.shared.readStock(of: .mango))
    }
    
    func initializeStepper() {
        strawberryStepper.minimumValue = 0
        bananaStepper.minimumValue = 0
        pineappleStepper.minimumValue = 0
        kiwiStepper.minimumValue = 0
        mangoStepper.minimumValue = 0
        strawberryStepper.value =  Double(JuiceMaker.shared.readStock(of: .strawberry))
        bananaStepper.value = Double(JuiceMaker.shared.readStock(of: .banana))
        pineappleStepper.value = Double(JuiceMaker.shared.readStock(of: .pineapple))
        kiwiStepper.value = Double(JuiceMaker.shared.readStock(of: .kiwi))
        mangoStepper.value = Double(JuiceMaker.shared.readStock(of: .mango))
    }
}
