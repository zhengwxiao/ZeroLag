//
//  FlightsViewController.swift
//  ZeroLag
//
//  Created by Yuri  on 1/26/20.
//  Copyright © 2020 Z Xiao. All rights reserved.
//

import UIKit

class FlightsViewController: UIViewController {
    @IBOutlet weak var FlightNum: UILabel!
    @IBOutlet weak var DepartLabel: UILabel!
    @IBOutlet weak var ArrivalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm"
        
        FlightNum.text = choice?.flightNumber
        DepartLabel.text = choice?.departureTime
        ArrivalLabel.text = choice?.arrivalTime
        // Do any additional setup after loading the view.
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
