//
//  OrderJuiceButton.swift
//  JuiceMaker
//
//  Created by 이영우 on 2021/03/19.
//

import UIKit

class OrderJuiceButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    var juice: Juice?
    
    func make(using juice: Juice) -> UIAlertController {
        let alert = UIAlertController()
        do {
            try JuiceMaker.shared.makeJuice(using: juice)
            return alert.alertOfSuccess(juice: juice)
        } catch {
            return alert.alertOfFail()
        }
    }
}
