//
//  ViewController.swift
//  ZeroLag
//
//  Created by Z Xiao on 1/25/20.
//  Copyright © 2020 Z Xiao. All rights reserved.
//

import UIKit
import CountdownLabel

class ViewController: UIViewController {
    
    @IBOutlet weak var waterReminderLabel: CountdownLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        waterReminderLabel.countdownDelegate = self
        waterReminderLabel.setCountDownTime(minutes: 60)
        waterReminderLabel.start()
    }
    
    
}

extension ViewController: CountdownLabelDelegate {
    func countdownFinished() {
        NotificationController().scheduleReminders()
    }
    
    func countingAt(timeCounted: TimeInterval, timeRemaining: TimeInterval) {
        debugPrint("time counted at delegate=\(timeCounted)")
        debugPrint("time remaining at delegate=\(timeRemaining)")
    }
    
}


