//
//  ViewController.swift
//  BMICalculator
//
//  Created by Jenna Marquardt on 2/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightFT: UITextField!
    @IBOutlet weak var heightIN: UITextField!
    @IBOutlet weak var weightLB: UITextField!
    
    @IBOutlet weak var heightCM: UITextField!
    @IBOutlet weak var weightKG: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func measurementChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex ==  0 {
            
        } else {
            
        }
    }

    @IBAction func reset(_ sender: UIButton) {
    }
    
    @IBAction func computeBMI(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toBMIView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toBMIView" {
            let navigation = segue.destination as! BMIViewController
            //navigation.rTitle = recipeLogic.getTitle(recipeLogic.getIndex())
        }
    }
}

