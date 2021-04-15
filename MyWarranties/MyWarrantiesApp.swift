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
////        UITabBar.appearance().backgroundColor = UIColor(named: "tabbarColor")
//        UITabBar.appearance().barTintColor = UIColor.white // UIColor(named: "tabbarColor")
//        UITabBar.appearance().selectedItem?.badgeColor = .white
//        
//        
//        UINavigationBar.appearance().isTranslucent = false
//        UINavigationBar.appearance().barTintColor = UIColor.white // UIColor(named: "tabbarColor")
//        UINavigationBar.appearance().backgroundColor = UIColor(named: "tabbarColor")
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white] //[.foregroundColor: UIColor(named: "tabbarColor") ?? UIColor.white]
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "tabbarColor")]         //Use this if NavigationBarTitle is with displayMode = .inline
//        
//        UITableView.appearance().backgroundColor =  UIColor.clear // UIColor(named: "tabbarColor")
//        UITableView.appearance().separatorStyle = .none
//        
//        UITableViewCell.appearance().backgroundColor = UIColor(named: "tabbarColor")
//        UITableViewCell.appearance().selectionStyle = .none
        
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
