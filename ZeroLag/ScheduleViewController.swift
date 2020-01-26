//
//  ScheduleViewController.swift
//  ZeroLag
//
//  Created by Z Xiao on 1/25/20.
//  Copyright © 2020 Z Xiao. All rights reserved.
//

import UIKit
import CountdownLabel

class ScheduleViewController: UIViewController {
    
    @IBOutlet weak var waterCountdownLabel: CountdownLabel!
    
    @IBOutlet weak var sleepCountdownLabel: CountdownLabel!
    
    
    let notificationController = NotificationController()
    let customBlue = UIColor(red: 0.029, green: 0.269, blue: 0.629, alpha: 0.58)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        waterCountdownLabel.textColor = customBlue
        waterCountdownLabel.font = UIFont(name:"Futura-Bold", size: 25)
        waterCountdownLabel.setCountDownTime(minutes: 10) // Input in seconds
        waterCountdownLabel.then(targetTime: 1) { [unowned self] in
            self.notificationController.scheduleReminders(title: "Drink Water", body: "Hydrate or diedrate", delay: 1)
        }
        waterCountdownLabel.start()
        
        sleepCountdownLabel.textColor = .systemOrange
        sleepCountdownLabel.font = UIFont(name:"Futura-Bold", size: 25)
        sleepCountdownLabel.setCountDownTime(minutes: 20) // Input in seconds
        sleepCountdownLabel.then(targetTime: 1) { [unowned self] in
            self.notificationController.scheduleReminders(title: "Time to Sleep", body: "Try to sleep now to beat jet lag!", delay: 1)
        }
        sleepCountdownLabel.start()
        
    }
}

extension ScheduleViewController: CountdownLabelDelegate {
    func countdownFinished() {
        
    }
    
    func countingAt(timeCounted: TimeInterval, timeRemaining: TimeInterval) {
        print(timeRemaining)
    }
    
}


