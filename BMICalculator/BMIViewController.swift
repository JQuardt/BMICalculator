//
//  BMIViewController.swift
//  BMICalculator
//
//  Created by Jenna Marquardt on 2/20/24.
//

import UIKit

class BMIViewController: UIViewController {
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var bmi : Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = String(bmi)
        
        if bmi < 18.5 {
            weightLabel.text = "underweight"
        } else if bmi < 24.9 {
            weightLabel.text = "normal weight"
        } else if bmi < 29.9 {
            weightLabel.text = "overweight"
        } else {
            weightLabel.text = "obese"
        }
    }
    
    @IBAction func `return`(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
