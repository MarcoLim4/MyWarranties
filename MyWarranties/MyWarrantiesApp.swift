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
        
//        UITabBar.appearance().isTranslucent = false
//        UITabBar.appearance().backgroundColor = UIColor(named: "darkGreen")
//        UITabBar.appearance().barTintColor = UIColor(Color("orange"))
//        UITabBar.appearance().selectedItem?.badgeColor = UIColor(Color("orange"))
////
//
//                
//        UINavigationBar.appearance().isTranslucent = false
//        UINavigationBar.appearance().barTintColor = UIColor(named: "darkGreen")
//        UINavigationBar.appearance().backgroundColor = UIColor(named: "darkGreen")
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "officialGreen") ?? Color.green]
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white,
//                                                            .backgroundColor: UIColor(named: "darkGreen") ?? UIColor.darkGray]
//        
//
//        
////        
//        UITableView.appearance().backgroundColor =  UIColor(Color("darkGreen")) // UIColor(named: "tabbarColor")
//        UITableView.appearance().allowsSelection = false
//        
//        UITableView.appearance().separatorStyle = .none
////        
//        UITableViewCell.appearance().backgroundColor = UIColor(named: "darkGreen")
//        UITableViewCell.appearance().selectionStyle = .none
//        UITableViewCell.appearance().selectedBackgroundView = UIView()
        
        
        WarrantiesReminders.askForPermission { _ in
            
            /*
                
                We don't need to do anything here.
                Just to make sure we ask permission on App loading
            
            */
        
        }
        
        
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
