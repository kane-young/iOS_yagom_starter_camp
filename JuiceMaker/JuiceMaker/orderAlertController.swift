//
//  orderAlertController.swift
//  JuiceMaker
//
//  Created by Yunhwa on 2021/03/19.
//

import UIKit

class OrderAlertController: UIAlertController {
    func alertOfSuccess(juice: Juice) -> UIAlertController {
        let alert = UIAlertController(title: "\(juice.name) " + JuiceMakerConstant.successTitle, message: JuiceMakerConstant.successMessage, preferredStyle: .alert)
        let ok = UIAlertAction(title: JuiceMakerConstant.yes, style: .default, handler: nil)
        alert.addAction(ok)
        return alert
    }
    
    func alertOfFail() -> UIAlertController {
        let alert = UIAlertController(title: JuiceMakerConstant.failTitle, message: JuiceMakerConstant.failMessage, preferredStyle: .alert)
        let ok = UIAlertAction(title: JuiceMakerConstant.yes, style: .default, handler: { (_) in
            guard let rootView = UIApplication.shared.windows.last?.rootViewController else {
                return
            }
            let mainStoryboard = UIStoryboard(name: JuiceMakerConstant.main, bundle: nil)
            let stockView = mainStoryboard.instantiateViewController(identifier: JuiceMakerConstant.stockVC)
            rootView.present(stockView, animated: false, completion: nil)
        })
        let cancel = UIAlertAction(title: JuiceMakerConstant.no, style: .default, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        return alert
    }
}
