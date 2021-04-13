//
//  SettingsViewController.swift
//  MyWarranties
//
//  Created by Marco Lima on 2021-04-13.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        
        VStack {
            
            VStack(alignment: .leading) {
            
                Text("Not 100% what kind of information we'll add here!")
                    .font(.caption)
                    .padding()
                
                Text("But for example, permission to send reminders is one!")
                    .font(.caption)
                    .padding()

            }
            
            VStack(alignment: .center) {
                
                Text("So... Coming soon!")
                    .font(.caption)
                    .padding()

            }
            
        }
        

        
        
    }
}

struct SettingsViewController_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
