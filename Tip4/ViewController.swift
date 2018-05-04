//
//  ViewController.swift
//  Tip4
//
//  Created by Johnny Pham on 2/26/16.
//  Copyright © 2016 Johnny Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalTip: UILabel!
    @IBOutlet weak var totalSplit: UILabel!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var splitPercentage: UILabel!
    @IBOutlet weak var labelTotalPay: UILabel!
    @IBOutlet weak var totalForPerson: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageSliderValue: UISlider!
    @IBOutlet weak var splitControl: UISlider!
    
    
    @IBOutlet weak var bootomCons: NSLayoutConstraint!
    

    @IBOutlet weak var bootomCons2: NSLayoutConstraint!
    
    @IBOutlet weak var bottomCons3: NSLayoutConstraint!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let tipPercentageDf = defaults.integer(forKey: "tipPercentage")
        let splitDf = defaults.integer(forKey: "split")
        let splitPercentageDf = (Float)(1)/(Float)(splitDf)*(Float)(100)
        
        tipPercentageSliderValue.value = (Float)(tipPercentageDf)
        splitControl.value = (Float)(splitDf)
        
        print(splitPercentageDf)
        
        
        
        
        totalTip.text = "0.00"
        totalSplit.text = "\(splitDf)"
        
        tipPercentage.text = "\(tipPercentageDf) %"
        splitPercentage.text = "\(splitPercentageDf) %"
        
        labelTotalPay.text = "TOTAL: 0.00"
        totalForPerson.text = "0.00"
        
        if(UIScreen.main.bounds.size.height <= 568 ){
            self.bootomCons.constant = 70
            self.bootomCons2.constant = 12
            self.bottomCons3.constant = 8
            
            self.totalForPerson.font = UIFont.systemFont(ofSize: 20)
        }
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditChanged(_ sender: Any) {
        
        
        
        
        
        let tipControlValue = roundf(tipPercentageSliderValue.value)
        let splitControlValue = roundf(splitControl.value)
        
        
        
        
        let vBillAmount = NSString(string: billAmountTextField.text!).floatValue
        let vTotalPerson = splitControlValue
        let vTotalTip = vBillAmount*tipControlValue/100
        let vTotalPay = vTotalTip + vBillAmount
        let vTotalForPerson = vTotalTip/vTotalPerson
        
        
        totalTip.text = "\(vTotalTip)"
        totalSplit.text = "\(Int(splitControlValue))"
        
        tipPercentage.text = String(format: "%.f %%", tipControlValue )
        splitPercentage.text = String(format: "%.0f %%", 1/vTotalPerson*100)
        
        labelTotalPay.text =  String(format: "TOTAL: %.2f", vTotalPay )
        totalForPerson.text = String(format: "%.2f", vTotalForPerson )
        
        
        
        
    }
    
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
}

