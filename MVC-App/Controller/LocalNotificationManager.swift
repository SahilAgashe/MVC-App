//
//  LocalNotificationManager.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 04/01/24.
//

import UserNotifications

class LocalNotificationManager: NSObject {
    
    static let shared = LocalNotificationManager()
    private let currentNotificationCenter = UNUserNotificationCenter.current()
    
    private override init() {
        super.init()
        // Step-1 Request permission to display notifications
        currentNotificationCenter.requestAuthorization(options: [.badge, .sound, .alert]) { (permissionGranted, error) in
            if permissionGranted{
                print("DEBUG LocalNotificationManager: Notication permission granted")
            } else {
                print("DEBUG LocalNotificationManager: Notication permission denied")
            }
        }
        currentNotificationCenter.delegate = self
        
        
    
        print("DEBUG LocalNotificationManager: init called...")
    }
    
    
   
    // MARK: - Helpers
    func addNotification(content: UNNotificationContent,trigger: UNNotificationTrigger?, notificationIdentifier: String) {
        // Step-4 Create the request and schedule the request with the system.
        let request = UNNotificationRequest(identifier: notificationIdentifier, content: content, trigger: trigger)
        currentNotificationCenter.add(request, withCompletionHandler: {
            (error) in
            if let error {
                print("DEBUG: Error \(error.localizedDescription) in notification \(notificationIdentifier)")
            } else {
                print("DEBUG: Successfully added reminder!")
            }
        })
    }
    
    func removeNotification(notificationIdentifier: String) {
        currentNotificationCenter.removePendingNotificationRequests(withIdentifiers: [notificationIdentifier])
    }
}

extension LocalNotificationManager: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        //UIApplication.shared.applicationIconBadgeNumber = 0
        UNUserNotificationCenter.current().setBadgeCount(0)
        let request = response.notification.request
        
        if response.actionIdentifier == "snoozeAction" {
            
            let newContent = request.content.mutableCopy() as! UNMutableNotificationContent
            newContent.title = request.content.title
            newContent.body = request.content.body
            newContent.subtitle = "Snooze for 5 Seconds"
            let newTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            addNotification(content: newContent, trigger: newTrigger, notificationIdentifier: request.identifier)
        }
        else if response.actionIdentifier == "stopAction" {
            removeNotification(notificationIdentifier: request.identifier)
            //delegate?.turnOffAlarmSwitch(alarmIdentifier: request.identifier)
        }
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .banner])
        let request = notification.request
        if request.trigger?.repeats == true {
            let newContent = request.content.mutableCopy() as! UNMutableNotificationContent
            newContent.title = request.content.title
            newContent.subtitle = "Snooze With 1 Minute Interval"
            newContent.body = request.content.body
            let newTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
            addNotification(content: newContent, trigger: newTrigger, notificationIdentifier: request.identifier)
        }
    }
    
}
