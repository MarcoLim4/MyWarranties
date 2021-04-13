//
//  MyWarrantiesApp.swift
//  MyWarranties
//
//  Created by Marco Lima on 2021-04-06.
//

import SwiftUI

@main
struct MyWarrantiesApp: App {

    @StateObject var dataController: DataController
    
    init() {
        
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
        
    }
    

    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: save)

        }
        
    }
    
    // Every time the app goes into background mode, we save the data
    func save(_ note: Notification) {
        dataController.save()
    }

}
