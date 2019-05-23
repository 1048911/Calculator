//
//  ViewController.swift
//  Calculator
//
//  Created by CASE on 5/11/19.
//  Copyright © 2019 CASE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumbers : Bool = true
    private var answer : Double = 0.0
    private var displayValue : Double {
        get {
            guard let number = Double(displayLabel.text!) else{
                fatalError("Cannot convert displayLabel.text into a Double.")
            }
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
     private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumbers = true


       
      calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) {
            displayValue = result
            }
            
        }

            
    }
    
  
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumbers {
                
            displayLabel.text = numValue
                isFinishedTypingNumbers = false
            
            } else {
               
                if numValue == "." {
                    
                        let isInt = floor(displayValue) == displayValue
                        if !isInt {
                            return
                        }
                }
                
               
                displayLabel.text = displayLabel.text! + numValue
            }
            
            
        }
    }
    
}

