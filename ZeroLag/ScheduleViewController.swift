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
    
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var sleepLabel: UILabel!
    
    @IBOutlet weak var sleepScheduleTextView: UITextView!
    
    @IBOutlet weak var waterCountdownLabel: CountdownLabel!
    
    @IBOutlet weak var sleepCountdownLabel: CountdownLabel!
    
    @IBOutlet weak var sleepImageView: UIImageView!
    
    
    let notificationController = NotificationController()
    let customBlue = UIColor(red: 0.029, green: 0.269, blue: 0.629, alpha: 0.58)
    let customPurple = UIColor(hue: 0.6556, saturation: 0.41, brightness: 0.61, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        waterCountdownLabel.textColor = customBlue
        waterCountdownLabel.font = UIFont(name:"Futura-Bold", size: 25)
        waterCountdownLabel.setCountDownTime(minutes: 30) // Input in seconds
        waterCountdownLabel.then(targetTime: 1) { [unowned self] in
            self.notificationController.scheduleReminders(title: "Drink Water", body: "You should a glass of water to feel your best! Hydrate or diedrate!", delay: 1)
        }
        waterCountdownLabel.start()
        
        sleepCountdownLabel.textColor = .systemOrange
        sleepCountdownLabel.font = UIFont(name:"Futura-Bold", size: 25)
        sleepCountdownLabel.setCountDownTime(minutes: 2000) // Input in seconds
        sleepCountdownLabel.then(targetTime: 1) { [unowned self] in
            self.notificationController.scheduleReminders(title: "Time to Sleep", body: "Try to sleep now to beat jet lag!", delay: 1)
            self.sleepLabel.text = "Wake up in"
            self.sleepCountdownLabel.addTime(time: 3000)
            self.sleepImageView.image = UIImage(named: "moon")
            self.view.backgroundColor = self.customPurple
            self.sleepScheduleTextView.textColor = .white
        }
        sleepCountdownLabel.start()
        
        let scheduleLabel = UserDefaults.standard.array(forKey: "newSleepDate")
        
        let newSleepTime = UserDefaults.standard.array(forKey: "newSleepTime")
        let newEndSleepTime = UserDefaults.standard.array(forKey: "newEndSleepTime")
        var string = ""
        for i in 0..<scheduleLabel!.count {
            string.append("\(scheduleLabel![i]): \(newSleepTime![i]):00 - \(newEndSleepTime![i]):00\n")
        }
        sleepScheduleTextView.text = string
    }
    @IBAction func waterDonePressed(_ sender: Any) {
        waterCountdownLabel.addTime(time: 30)
    }
    @IBAction func skipPressed(_ sender: Any) {
        sleepCountdownLabel.setCountDownTime(minutes: 3)
        
    }
}

extension ScheduleViewController: CountdownLabelDelegate {
    func countdownFinished() {
        
    }
    
    func countingAt(timeCounted: TimeInterval, timeRemaining: TimeInterval) {
        print(timeRemaining)
    }
    
}


