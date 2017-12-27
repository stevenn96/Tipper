//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Steven Natalius on 12/26/17.
//  Copyright © 2017 Steven Natalius. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipController: UISegmentedControl!
    var defaults: UserDefaults!
    
    override func viewWillAppear(_ animated: Bool) {
        defaults = UserDefaults.standard
        let index = defaults.integer(forKey: "index")
        tipController.selectedSegmentIndex = index
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        defaults = UserDefaults.standard
        let index = defaults.integer(forKey: "index")
        tipController.selectedSegmentIndex = index
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    @IBAction func changeTip(_ sender: Any) {
        let tipPercentages = [0.10, 0.15, 0.20, 0.25]
        let percentage = tipPercentages[tipController.selectedSegmentIndex]
        defaults.set(tipController.selectedSegmentIndex, forKey: "index")
        defaults.set(percentage, forKey: "percentage")
        defaults.synchronize()
    }
}
