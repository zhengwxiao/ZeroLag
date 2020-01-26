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
        waterReminderLabel.setCountDownTime(minutes: 3) // Input in seconds
        waterReminderLabel.then(targetTime: 1) { [unowned self] in
            self.notificationController.scheduleReminders(title: "Drink Water", body: "Hydrate or diedrate", delay: 1)
        }
        waterReminderLabel.start()
    }
}

extension ViewController: CountdownLabelDelegate {
    func countdownFinished() {
        
    }
    
    func countingAt(timeCounted: TimeInterval, timeRemaining: TimeInterval) {
        print(timeRemaining)
    }
    
}


