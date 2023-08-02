//
//  ViewController.swift
//  Calculator
//
//  Created by appsgaga on 2018/9/8.
//  Copyright © 2018 appsgaga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0   //現在數字
    var previousNumber:Double = 0   //上一個數字
    var performingMath = false
    var operation = "none"
    var startNew = true
    var con :String = ""
    var answer :Int = 0
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @IBOutlet weak var label: UILabel!
    
    func makeOKNumberString(from number:Double){
        var okText:String
        if floor(number) == number{
            okText = "\(Int(number))"
        }else{
            okText = "\(number)"
        }
        if okText.count >= 9{
            okText = String(okText.prefix(9))
        }
        label.text = okText
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        let inputNumber = sender.tag - 1
        if label.text != nil{
            if startNew == true{
                label.text = "\(inputNumber)"
                con = label.text!
                print(con)
                startNew = false
            }else{
                label.text = label.text! + "\(inputNumber)"
                con += String(inputNumber)
                print(con)
                }
            numberOnScreen = Double(label.text!) ?? 0
            }
           
        }
    
    
    @IBAction func clear(_ sender: UIButton) {
        label.text = "0"
        numberOnScreen = 0
        previousNumber = 0
        performingMath = false
        operation = "none"
        startNew = true
    }
    
    
    @IBAction func add(_ sender: UIButton) {
        label.text = "+"
        con += "+"
        print(con)
        operation = "+"
        performingMath = true
    }
    
    @IBAction func substract(_ sender: UIButton) {
        label.text = "-"
        con += "-"
        print(con)
        operation = "-"
        performingMath = true
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        label.text = "*"
        con += "*"
        print(con)
        operation = "*"
        performingMath = true
    }
    
    @IBAction func divide(_ sender: UIButton) {
        label.text = "/"
        con += " / "
        print(con)
        operation = "/"
        performingMath = true
    }
    
    @IBAction func giveMeAnswer(_ sender: UIButton) {
        if performingMath {
                   let expression = NSExpression(format: con)
                   if let result = expression.expressionValue(with: nil, context: nil) as? Double {
                       makeOKNumberString(from: result)
                       con = String(result)
                   }
                   performingMath = false
                   startNew = false
                    
               }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

