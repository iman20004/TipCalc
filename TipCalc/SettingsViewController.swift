//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Iman Ali on 1/31/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var nightMode: UILabel!
    @IBOutlet weak var darkSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // Function to switch to night mode
    @IBAction func themeSwitch(_ sender: UISwitch) {
        
        // Storing the boolean value of the night switch
        UserDefaults.standard.set(sender.isOn, forKey: "boolDark")
        
        // Notification for Tip Calculator screen
        NotificationCenter.default.post(name: Notification.Name("darkModeChanged"), object: nil)
        
        // Change background according to bool
        if sender.isOn{
            self.view.backgroundColor = .lightGray
        } else {
            self.view.backgroundColor = .white
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
