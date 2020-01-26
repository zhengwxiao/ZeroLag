//
//  PreferencesViewController.swift
//  ZeroLag
//
//  Created by Andrew Chin on 1/26/20.
//  Copyright © 2020 Z Xiao. All rights reserved.
//

import UIKit

class PreferencesViewController: UIViewController {

    @IBOutlet weak var sleepDatePicker: UIDatePicker!
    
    @IBOutlet weak var wakeDatePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func donePressed(_ sender: Any) {
        UserDefaults.standard.set(sleepDatePicker.date, forKey: "sleepDatePicker")
        UserDefaults.standard.set(wakeDatePicker.date, forKey: "wakeDatePicker")
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
