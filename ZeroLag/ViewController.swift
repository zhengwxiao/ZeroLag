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
    
    let notificationController = NotificationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        waterReminderLabel.countdownDelegate = self
        waterReminderLabel.setCountDownTime(minutes: 10) // Input in seconds
        waterReminderLabel.start()
    }
}

extension ViewController: CountdownLabelDelegate {
    func countdownFinished() {
        notificationController.scheduleReminders()
    }
    
    func countingAt(timeCounted: TimeInterval, timeRemaining: TimeInterval) {
    }
    
}


