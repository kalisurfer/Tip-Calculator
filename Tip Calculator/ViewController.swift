//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Sean Scott on 5/19/15.
//  Copyright (c) 2015 kubeworks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var tip10Label: UILabel!
    @IBOutlet weak var tip15Label: UILabel!
    @IBOutlet weak var tip20Label: UILabel!
    @IBOutlet weak var amount10Label: UILabel!
    @IBOutlet weak var amount15Label: UILabel!
    @IBOutlet weak var amount20Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        calculateTipButtonPressed(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func calculateTipButtonPressed(sender: AnyObject) {
        println("Tip")
        
        var amount = ( amountTextField.text as NSString).doubleValue
        
        var tip10 = amount * 0.10
        var tip15 = amount * 0.15
        var tip20 = amount * 0.20
        var tip30 = amount * 0.30
        var amount10 = amount + tip10
        var amount15 = amount + tip15
        var amount20 = amount + tip20
        var amount30 = amount + tip30
        
        
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        
        tip10Label.text = numberFormatter.stringFromNumber(tip10)
        tip15Label.text = numberFormatter.stringFromNumber(tip15)
        tip20Label.text = numberFormatter.stringFromNumber(tip20)
        
        amount10Label.text = numberFormatter.stringFromNumber(amount10)
        amount15Label.text = numberFormatter.stringFromNumber(amount15)
        amount20Label.text = numberFormatter.stringFromNumber(amount20)
    }
}

