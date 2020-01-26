//
//  NotificationController.swift
//  ZeroLag
//
//  Created by Z Xiao on 1/25/20.
//  Copyright © 2020 Z Xiao. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationController: NSObject {
    let notificationCenter = UNUserNotificationCenter.current()
    let content = UNMutableNotificationContent()
    
    // Transferred to ExensionDelegate
    func scheduleReminders() {
        notificationCenter.removeAllPendingNotificationRequests()
        
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            print("Notification authorization: (\(granted)")
        }
        
        content.title = "Drink Water"
        content.body = "Hydrate or diedrate!"
        content.sound = UNNotificationSound.default
           
        // Create the trigger as a repeating event.
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        // Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                    content: content, trigger: trigger)

        // Schedule the request with the system.
        notificationCenter.add(request) { (error) in
           if error != nil {
              // Handle any errors.
           }
        }
    }
}
