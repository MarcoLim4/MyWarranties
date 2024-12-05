//
//  WarrantiesNotifications.swift
//  MyWarranties
//
//  Created by Marco Lima on 2021-04-22.
//

import Foundation
import UserNotifications
import CoreData

struct WarrantiesNotifications {
    
    func addReminders(for product: Products, completion: @escaping (Bool) -> Void) {
        
        let center = UNUserNotificationCenter.current()
        
        center.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                
                self.requestNotifications { success in
                    if success {
                        self.placeReminders(for: product, completion: completion)
                    } else {
                        DispatchQueue.main.async {
                            completion(false)
                        }
                    }
                }
                
            case .authorized:
                self.placeReminders(for: product, completion: completion)
            default:
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }
    }
    
    func removeReminders(for product: Products) {
        
        let center = UNUserNotificationCenter.current()
        let id = product.productID?.uuidString ?? UUID().uuidString
        center.removePendingNotificationRequests(withIdentifiers: [id])
        
    }
    
    private func requestNotifications(completion: @escaping (Bool) -> Void) {
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound, .badge,]) { granted, _ in
            completion(granted)
        }
        
    }
    
    private func placeReminders(for product: Products, completion: @escaping (Bool) -> Void) {
        
        let content = UNMutableNotificationContent()
        content.sound = .default
        content.title = "The Warranties App"
        content.subtitle = product.prodName
        content.body = "Warranty Expiring alert!"
        
        let components = Calendar.current.dateComponents([.calendar, .month, .day, .year, .hour], from: product.warrantyExpiryDate ?? Date())
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false) // No repeats. One addition to calendar
        
        // Although we use the nil coallescing here, it is garanteed we will have a UUID string for the productID
        
        let id = product.productID?.uuidString ?? UUID().uuidString
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            DispatchQueue.main.async {
                if error == nil {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
        
    }
    
    
}
