//
//  AddFlightViewController.swift
//  ZeroLag
//
//  Created by Z Xiao on 1/26/20.
//  Copyright © 2020 Z Xiao. All rights reserved.
//

import UIKit

class AddFlightViewController: UIViewController {
    
    @IBOutlet weak var flightDatePicker: UIDatePicker!
    @IBOutlet weak var flightNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    @IBAction func searchPressed(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        print(formatter.string(from: flightDatePicker.date))
        print(flightNumberTextField.text!)
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
