//
//  ViewController.swift
//  StrategyDemo
//
//  Created by JackySONE on 2018/9/14.
//  Copyright © 2018年 JackySONE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var numberTextfild: UITextField!
    @IBOutlet weak var listTextView: UITextView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var optionPickerView: UIPickerView!

    var total: Float = 0.0

    let options = ["正常收費", "滿300送100", "打八折"]
    var selectedIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func confirmButtonClick(_ sender: UIButton) {

        guard let priceString = priceTextField.text, let numberString = numberTextfild.text, let cashier = CashFactory.createCashAccept(type: options[selectedIndex]) else {
            return
        }

        var totalPrices: Float = 0.0

        totalPrices = cashier.acceptCash(money: (Float(priceString)!) * Float(numberString)!)

        total = total + totalPrices
        
        listTextView.text = listTextView.text + "\n單價：\(priceString) 數量：\(numberString) \(options[selectedIndex]) 合計：\(totalPrices)"
        
        resultLabel.text = "\(total)"
        
        self.view.endEditing(true)
    }
    
    @IBAction func clearButtonClick(_ sender: UIButton) {
        
        priceTextField.text = nil
        numberTextfild.text = nil
        listTextView.text = nil
        total = 0.0
        resultLabel.text = "0.00"
        
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }

}
