//
//  ViewController.swift
//  Tipper
//
//  Created by Steven Natalius on 12/26/17.
//  Copyright © 2017 Steven Natalius. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var fourLabel: UILabel!
    @IBOutlet weak var fiveLabel: UILabel!
    var defaults: UserDefaults!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        defaults = UserDefaults.standard
        calculateTip(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let percentage = defaults.double(forKey: "percentage")
        let tip = bill * percentage
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twoLabel.text = String(format: "$%.2f each", total/2)
        threeLabel.text = String(format: "$%.2f each", total/3)
        fourLabel.text = String(format: "$%.2f each", total/4)
        fiveLabel.text = String(format: "$%.2f each", total/5)
    }
}

