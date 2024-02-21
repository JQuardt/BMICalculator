//
//  ViewController.swift
//  BMICalculator
//
//  Created by Jenna Marquardt on 2/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    var myLogic = BMILogic()
    
    @IBOutlet weak var impStackView: UIStackView!
    @IBOutlet weak var metStackView: UIStackView!
    @IBOutlet var inputText: [UITextField]!
    @IBOutlet var errorLabels: [UILabel]!
    @IBOutlet weak var measurementTypeSeg: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func measurementChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex ==  0 {
            impStackView.isHidden = false
            metStackView.isHidden = true
        } else {
            impStackView.isHidden = true
            metStackView.isHidden = false
        }
    }

    @IBAction func reset(_ sender: UIButton) {
        //clear all error labels
        for i in 0...4 {
            errorLabels[i].isHidden = true
            inputText[i].layer.borderWidth = 0.0
            inputText[i].text = ""
        }
    }
    
    @IBAction func computeBMI(_ sender: UIButton) {
        //hide all error labels
        for i in 0...4 {
            errorLabels[i].isHidden = true
            inputText[i].layer.borderWidth = 0.0
        }

        if measurementTypeSeg.selectedSegmentIndex == 0 { //imperial
            let checkedValueArray = [
                myLogic.checkValue(inputText[0].text!),
                myLogic.checkValue(inputText[1].text!),
                myLogic.checkValue(inputText[2].text!)
            ]
            //update values of weight, height, and bmi in logic
            if checkedValueArray[0].isValid && checkedValueArray[1].isValid && checkedValueArray[2].isValid {
                //Updatebmi
                for i in 0...2 {
                    inputText[i].layer.borderWidth = 0.0
                }
                myLogic.computeBMI(Double(inputText[0].text!)!, Double(inputText[1].text!)!, Double(inputText[2].text!)!)
                goToSegue()
            } else {
                //update error labels
                for i in 0...2 {
                    if checkedValueArray[i].isValid == false {
                        errorLabels[i].text = checkedValueArray[i].result
                        errorLabels[i].isHidden = false
                        inputText[i].layer.borderColor = UIColor.red.cgColor
                        inputText[i].layer.borderWidth = 1.0
                    }
                }
            }
        } else { //metric
            //check that each value is valid
            let checkedValueArray = [
                myLogic.checkValue(inputText[3].text!),
                myLogic.checkValue(inputText[4].text!)
            ]
            //update values of weight, height, and bmi in logic
            if checkedValueArray[0].isValid && checkedValueArray[1].isValid {
                for i in 3...4 {
                    inputText[i].layer.borderWidth = 0.0
                }
                myLogic.computeBMI(Double(inputText[3].text!)!, Double(inputText[4].text!)!)
                goToSegue()
            } else {
                for i in 0...1 {
                    if checkedValueArray[i].isValid == false {
                        errorLabels[i + 3].text = checkedValueArray[i].result
                        errorLabels[i + 3].isHidden = false
                        inputText[i + 3].layer.borderColor = UIColor.red.cgColor
                        inputText[i + 3].layer.borderWidth = 1.0
                    }
                }
            }
        }
        
    }
    
    func goToSegue(){
        //Segue to next screen
        self.performSegue(withIdentifier: "toBMIView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toBMIView" {
            let navigation = segue.destination as! BMIViewController
            navigation.bmi = myLogic.getbmi()
        }
    }
}

