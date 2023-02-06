//
//  NotificationsController.swift
//  exPIERed
//
//  Created by Gianluca Annina on 04/02/23.
//

import SwiftUI
import UserNotifications
import CoreLocation


class NotificationManager {
    
    @AppStorage("TIMEDIS") var timeDis: String = "1h"
    @AppStorage("TIMEEFF") var timeEff: Double = 3600.0
    @AppStorage("FROM_VALUE") var selectedFrom: String = "08:00"
    @AppStorage("TO_VALUE") var selectedTo: String = "20:00"
    
    static let instance = NotificationManager() //singleton
    
    let options : UNAuthorizationOptions = [.alert, .sound, .badge] //opzioni che invierà all'app
    
    //funzione per richiedere i permessi all'utente
    func requestAuthorization(){
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                //se l'utente non accetta lancerà questo errore
                print("ERROR: \(error)")
                
            } else {
                //altrimenti succede questo
                print("SUCCESS")
            }
        }
        
    }
    
    
//    func scheduleNotification() {
//
//        let startHour = Int(selectedFrom.prefix(2))!
//        let endHour = Int(selectedTo.prefix(2))!
//
//        for ora in startHour...endHour {
//            let triggers = [
//            UNCalendarNotificationTrigger(dateMatching: DateComponents.triggerFor(hour: ora, minute: 00), repeats: true)]
//
//        for trigger in triggers {
//            // Create the content of the notification
//            let content = UNMutableNotificationContent()
//            content.title = "Are You Dreaming?"
//            content.body = "It's time for a Reality Check!"
//
//            let uuidString = UUID().uuidString
//            let request = UNNotificationRequest(identifier: uuidString,
//                        content: content, trigger: trigger)
//
//            let notificationCenter = UNUserNotificationCenter.current()
//            notificationCenter.add(request) { (error) in
//               if error != nil {
//               }
//            }
//        }
//        }
//    }
    
    
    
    func scheduleNotification(products:[Product]) {
        
      
        
        for product in products{
            var triggers: [UNCalendarNotificationTrigger] = []
                 triggers = [
                    UNCalendarNotificationTrigger(dateMatching: DateComponents.triggerFor(day: Calendar.current.component(.day, from: product.expiryDate), month: Calendar.current.component(.month, from: product.expiryDate),year: Calendar.current.component(.year, from: product.expiryDate)), repeats: true)]
            

        for trigger in triggers {
            // Create the content of the notification
            let content = UNMutableNotificationContent()
            content.title = product.name
            content.body = "Today \(product.name) will expire"

            let uuidString = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuidString,
                        content: content, trigger: trigger)

            let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.add(request) { (error) in
               if error != nil {
               }
            }
        }
        }
    }
    
    func deleteNotification(){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        //se vuoi eliminarle dall'iPhone direttamente
        
    }
    
}

extension DateComponents {
    static func triggerFor(day: Int, month: Int, year:Int) -> DateComponents {
      var component = DateComponents()
      component.calendar = Calendar.current
       component.day = day
       component.month = month
       component.year = year
      component.hour = 10
      component.minute = 0
      return component
   }
}
