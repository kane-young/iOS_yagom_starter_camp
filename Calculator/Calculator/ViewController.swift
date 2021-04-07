//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var decimal: DecimalCalculator!
    private var binary: BinaryCalculator!
    private var mode: CalculatorMode!
    
    @IBOutlet private weak var calculatorDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decimal = DecimalCalculator()
        binary = BinaryCalculator()
        mode = .decimal
    }

    // MARK: -IBAction function
    @IBAction func input(_ sender: CalCulatorButton) {
        if self.mode == .decimal {
            guard let buttonTitle = sender.currentTitle else { return
            }
            decimal.input(buttonTitle)
        } else if self.mode == .binary {
            guard let buttonTitle = sender.currentTitle else { return
            }
            binary.input(buttonTitle)
        }
    }
    
    @IBAction func convertSign(_ sender: CalCulatorButton) {
        if self.mode == .decimal {
            
        } else if self.mode == .binary {
            
        }
    }
    
    @IBAction func convertMode(_ sender: CalCulatorButton) {
        
    }
    
    // MARK: -method
    func display() {
        if self.mode == .decimal {
            calculatorDisplay.text = decimal.output()
        } else if self.mode == .binary {
            calculatorDisplay.text = binary.output()
        }
    }
}

