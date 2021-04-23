//
//  WarrantiesReminders.swift
//  MyWarranties
//
//  Created by Marco Lima on 2021-04-22.
//

import Foundation
import EventKit


struct WarrantiesReminders {
    
    private static let store = EKEventStore()
    
    private static let store2 = EKReminder()
    
    static func askForPermission(grantedAction: @escaping (Bool) -> Void) {
        
        store.requestAccess(to: .reminder) { (granted, error) in
            
            if let error = error {
                print(error)
                grantedAction(false)
            }

            if granted {
                grantedAction(true)
            } else {
                grantedAction(false)
            }
        }
    }
    
    
    static func addReminders(for product: Products, completion: @escaping (Bool, String) -> Void) {
        
        guard let calendar = store.defaultCalendarForNewReminders() else {
            completion(false, "")
            return
        }

        
        let newReminder = EKReminder(eventStore: store)
        
        newReminder.calendar = calendar
        newReminder.title = "The Warraties App"
        newReminder.notes = "Your product [\(product.prodName)] warrant will expire on \(product.warrantyExpiryDate?.toString() ?? ""))"
        
        if let dueDate = product.warrantyExpiryDate {
            newReminder.dueDateComponents = Calendar.current.dateComponents([.year, .month, .day], from: dueDate)
        } //  Date().addingTimeInterval(60 * 60 * 24 * 3)
        
        do {
            try store.save(newReminder, commit: true)
            completion(true, newReminder.calendarItemIdentifier)
        } catch {
            completion(false, "")
        }
        
    }
    
    static func removeReminder(completion: @escaping (Bool) -> Void) {
        
        let predicate = store.predicateForReminders(in: nil)
        
        store.fetchReminders(matching: predicate) { listOfReminders in
            
            // Get all reminders and check if we have the one we added
            if let allReminders = listOfReminders,
               let itemToRemove = allReminders.filter({ $0.calendarItemIdentifier == "identifier" }).first {
                
                do {
                    try store.remove(itemToRemove, commit: true)
                    completion(true)
                } catch {
                    completion(false)
                }

            } else {
                completion(false)
            }
            
        }
                
    }
    
}
