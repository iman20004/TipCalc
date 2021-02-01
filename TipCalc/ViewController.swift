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
        
        // show keyboard when app opened
        billAmountTextField.becomeFirstResponder()
        
        // check for night mode notification
        NotificationCenter.default.addObserver(self, selector: #selector(enableDark), name: Notification.Name("darkModeChanged"), object: nil)
    
    }
    
    // change to night/normal mode when settings switch changed
    @objc func enableDark(){
        // get bool value for defaults
        let boolDark = UserDefaults.standard.bool(forKey: "boolDark")
        
        // change mode accordingly
        if boolDark{
            view.backgroundColor = .lightGray
        }else{
            view.backgroundColor = .white
        }
    }
    
    // hide keyboard when tap elsewhere
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // bill amount from the text field (user input)
        let bill = Double(billAmountTextField.text!) ?? 0
                
        // percentages available for tip
        let tipPercentages = [0.15, 0.18, 0.2]
               
        // calculate tip by multiplying bill and tip percentage
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
                
        // calculate total by adding bill and tip
        let total = bill + tip
                
        // formatting to 2 decimal points
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    

}

