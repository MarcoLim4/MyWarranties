//
//  WarrantiesCalendar.swift
//  MyWarranties
//
//  Created by Marco Lima on 2021-04-22.
//

import Foundation
import EventKit

struct WarrantiesCalendar {

    let store = EKEventStore()

    func requestAccess(completion: @escaping EKEventStoreRequestAccessCompletionHandler) {
        store.requestAccess(to: EKEntityType.event) { (accessGranted, error) in
            completion(accessGranted, error)
        }
    }

    // Get Calendar auth status

    private func getAuthorizationStatus() -> EKAuthorizationStatus {
        return EKEventStore.authorizationStatus(for: EKEntityType.event)
    }


    func generateEvent(for product: Products, completion: @escaping (Bool) -> Void) {

        guard let calendar = store.defaultCalendarForNewEvents else {
            completion(false)
            return
        }


        let newEvent = EKEvent(eventStore: store)
        newEvent.calendar = calendar // store.defaultCalendarForNewEvents

        newEvent.title     = "The Warranties App"
        newEvent.notes     = "Your product [\(product.prodName)] warrant will expire on \(product.warrantyExpiryDate?.toString() ?? ""))"

        if let dueDate = product.warrantyExpiryDate {

            newEvent.startDate = dueDate
            newEvent.endDate   = dueDate


            if eventAlreadyExists(event: newEvent) {

                // Not sure waht do to... yet.


            } else {

                do {
                    try store.save(newEvent, span: .thisEvent)
                    completion(true)
                } catch {
                    completion(false)
                }

            }




        }

    }

    private func eventAlreadyExists(event eventToAdd: EKEvent) -> Bool {

        let predicate      = store.predicateForEvents(withStart: eventToAdd.startDate, end: eventToAdd.endDate, calendars: nil)
        let existingEvents = store.events(matching: predicate)

        let eventAlreadyExists = existingEvents.contains { (event) -> Bool in
            return eventToAdd.title == event.title && event.startDate == eventToAdd.startDate && event.endDate == eventToAdd.endDate
        }
        return eventAlreadyExists

    }







}
