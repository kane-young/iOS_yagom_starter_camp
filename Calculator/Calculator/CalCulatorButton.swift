//
//  CalCulatorButton.swift
//  Calculator
//
//  Created by 이영우 on 2021/04/04.
//

import UIKit

@IBDesignable
class CalCulatorButton: UIButton {
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = rect.height / 2
        clipsToBounds = true
    }
}
