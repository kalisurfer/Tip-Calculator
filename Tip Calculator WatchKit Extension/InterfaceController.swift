//
//  InterfaceController.swift
//  Tip Calculator WatchKit Extension
//
//  Created by Sean Scott on 5/20/15.
//  Copyright (c) 2015 kubeworks. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    // interface items
    @IBOutlet weak var tipPercentLabel: WKInterfaceLabel!
    @IBOutlet weak var tipButton: WKInterfaceButton!
    @IBOutlet weak var BillLabel: WKInterfaceButton!
    
    //overall app vars
    let numberFormatter = NSNumberFormatter()
    
    var billAmount : Double = 40.00
    var amountInc : Double = 0.25 //specifies by how much the amount is increase or decreased
    var tipCounter = ["10%","15%","20%"]
    var tipPercent = [0.10,0.15,0.20]
    var currentPos = 0
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        calculateTip()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        
        super.didDeactivate()
    }
    
    func calculateTip() {
        
        if currentPos == 3 {
            currentPos = 0
        }
        
        var tip = billAmount * tipPercent[currentPos]
        
        //show the tip %
        tipPercentLabel.setText("\(tipCounter[currentPos]) Tip")
        
        //calculate and show the tip
            tipButton.setTitle(numberFormatter.stringFromNumber(tip))
        
        println("the tip is \(tip)")
        
    }
    
    func updateBillAmount(amount : Double) {
        // setup the formatting
        numberFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        
        BillLabel.setTitle(numberFormatter.stringFromNumber(amount))
    }
    
    @IBAction func addBtnPressed() {
        println("add amount")
        billAmount += amountInc
        updateBillAmount(billAmount)
        calculateTip()
        println("new amount is \(billAmount)")
    }
    @IBAction func decreaseBtnPressed() {
        println("decrease amount")
        billAmount -= amountInc
        updateBillAmount(billAmount)
        calculateTip()
        println("new amount is \(billAmount)")
    }
    
    
    
    
    
    @IBAction func tipButtonPressed() {
        //increment the currentPos variable to cycle through the tips
        currentPos += 1
        calculateTip()
    }
    
   

    

}
