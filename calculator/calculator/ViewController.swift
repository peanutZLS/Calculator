//
//  ViewController.swift
//  Calculator
//
//  Created by appsgaga on 2018/9/8.
//  Copyright © 2018 appsgaga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation = "none"
    var startNew = true
    
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
                startNew = false
            }else{
                if label.text == "0" || label.text == "+" || label.text == "-" || label.text == "x" || label.text == "/" {
                    label.text = "\(inputNumber)"
                }else{
                    label.text = label.text! + "\(inputNumber)"
                }
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
        operation = "add"
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func substract(_ sender: UIButton) {
        label.text = "-"
        operation = "substract"
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        label.text = "x"
        operation = "multiply"
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func divide(_ sender: UIButton) {
        label.text = "/"
        operation = "divide"
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func giveMeAnswer(_ sender: UIButton) {
        if performingMath == true{
            if operation == "add"{
                numberOnScreen = previousNumber + numberOnScreen
                makeOKNumberString(from: numberOnScreen)
            }else if operation == "substract"{
                numberOnScreen = previousNumber - numberOnScreen
                makeOKNumberString(from: numberOnScreen)
            }else if operation == "multiply"{
                numberOnScreen = previousNumber * numberOnScreen
                makeOKNumberString(from: numberOnScreen)
            }else if operation == "divide"{
                numberOnScreen = previousNumber / numberOnScreen
                makeOKNumberString(from: numberOnScreen)
            }else if operation == "none"{
                label.text = "0"
            }
            performingMath = false
            startNew = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

