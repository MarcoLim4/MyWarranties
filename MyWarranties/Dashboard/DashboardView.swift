//
//  DashboardView.swift
//  MyWarranties
//
//  Created by Marco Lima on 2021-04-13.
//

import SwiftUI

struct DashboardView: View {
    
    var body: some View {
    
        VStack(alignment: .center) {

            
            Text("I'm the Dashboard")
                .padding()
            
            Text("Here, we'll show some summary data.")
                .padding()
            
            Text("Also, warranties about to expire, etc!")
                .padding()
            
        }
        
        
        
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
