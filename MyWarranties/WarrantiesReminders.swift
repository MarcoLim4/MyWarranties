import Foundation
import EventKit

enum WarrantyType {
    case normal
    case extended
}

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
    
    
    static func addReminders(for product: Products, warrantyType: WarrantyType, completion: @escaping (Bool, String) -> Void) {
        
        guard let calendar = store.defaultCalendarForNewReminders() else {
            completion(false, "")
            return
        }
        
        let newReminder = EKReminder(eventStore: store)
        let warrantyTypeString = warrantyType == .normal ? "" : "extended "
        
        newReminder.calendar = calendar
        newReminder.title = "The Warranties App"
        newReminder.notes = "Your product [\(product.prodName)] \(warrantyTypeString)warranty will expire on \(product.warrantyExpiryDate?.toString() ?? "")."
                
        if warrantyType == .normal {
            
            if let dueDate = product.warrantyExpiryDate {
                newReminder.dueDateComponents = Calendar.current.dateComponents([.year, .month, .day], from: dueDate.addingTimeInterval(getTimeInterVal()))
            }

        } else {
            
            if let dueDate = product.extendedWarrantyExpiryDate {
                newReminder.dueDateComponents = Calendar.current.dateComponents([.year, .month, .day], from: dueDate.addingTimeInterval(getTimeInterVal()))
            }

        }
        
        do {
            try store.save(newReminder, commit: true)
            
            DispatchQueue.main.async {
                completion(true, newReminder.calendarItemIdentifier)
            }
            
        } catch(let error) {
            
            print("Error adding reminder : \(error)")
            DispatchQueue.main.async {
                completion(false, "")
            }
            
        }
        
    }
    
    static func removeReminder(reminderID: String,  completion: @escaping (Bool) -> Void) {
        
        let predicate = store.predicateForReminders(in: nil)
        
        store.fetchReminders(matching: predicate) { listOfReminders in
            
            // Get all reminders and check if we have the one we added
            if let allReminders = listOfReminders,
               let itemToRemove = allReminders.filter({ $0.calendarItemIdentifier == reminderID }).first {
                
                do {
                    try store.remove(itemToRemove, commit: true)
                    
                    DispatchQueue.main.async {
                        completion(true)
                    }
                    
                } catch {
                    DispatchQueue.main.async {
                        completion(false)
                    }
                }

            } else {
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }
                
    }
    
    
    static func getTimeInterVal() -> TimeInterval {
        
//        let reminders = ["5 Days", "15 Days", "1 Month", "3 Months", "6 Months"]
        
        let noticePeriod = UserDefaults.standard.string(forKey: Constants.DefaultKeys.warrantyNotice.rawValue) ?? "5 Days"
        var timeInterVal = TimeInterval(-5 * 24 * 60 * 60)
        
        switch noticePeriod {
        case "5 Days":
            timeInterVal = TimeInterval(-5 * 24 * 60 * 60)
        case "15 Days":
            timeInterVal = TimeInterval(-15 * 24 * 60 * 60)
        case "1 Month":
            timeInterVal = TimeInterval(-30 * 24 * 60 * 60)
        case "3 Months":
            timeInterVal = TimeInterval(-90 * 24 * 60 * 60)
        case "6 Months":
            timeInterVal = TimeInterval(-180 * 24 * 60 * 60)
        default:
            timeInterVal = TimeInterval(-5 * 24 * 60 * 60)
        }

        return timeInterVal
        
    }
    
}
