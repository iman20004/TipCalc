//
//  ViewController.swift
//  TipCalc
//
//  Created by Iman Ali on 1/31/21.
//

import UIKit

class ViewController: UIViewController {

    // Connecting UI items to code
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Sets the title in the Navigation bar
        self.title = "Tip Calculator"
        
        // Keyboard always visible for bill amount input
        billAmountTextField.becomeFirstResponder()
        
        // Check for night mode notification
        NotificationCenter.default.addObserver(self, selector: #selector(enableDark), name: Notification.Name("darkModeChanged"), object: nil)
    
    }
    
    
    
    // Change to night/normal mode when settings switch changed
    @objc func enableDark(){
        // get the saved boolean value for night mode
        let boolDark = UserDefaults.standard.bool(forKey: "boolDark")
        
        // Change background accordingly
        if boolDark{
            view.backgroundColor = .lightGray
        }else{
            view.backgroundColor = UIColor.systemTeal
        }
    }
    
    
    
    // Hide keyboard when tap elsewhere
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    
    // Calculate the desired tip
    @IBAction func calculateTip(_ sender: Any) {
        // Bill amount from the text field (user input)
        let bill = Double(billAmountTextField.text!) ?? 0
                
        // Percentages available for tip
        let tipPercentages = [0.15, 0.18, 0.2]
               
        // Calculate tip by multiplying bill and tip percentage
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
                
        // Calculate total by adding bill and tip
        let total = bill + tip
                
        // Formatting to 2 decimal points
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    

}

