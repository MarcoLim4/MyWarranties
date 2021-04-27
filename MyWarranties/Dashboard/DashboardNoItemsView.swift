//
//  DashboardNoItemsView.swift
//  MyWarranties
//
//  Created by Marco Lima on 2021-04-27.
//

import SwiftUI

struct DashboardNoItemsView: View {
    var body: some View {
        
        VStack {
            
            VStack {

                Text("The Warranties App")
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("darkGreen"))
                    .padding([.bottom, .top], 20)

                
            }
            
            Image("launch-logo")
                .resizable()
//                .renderingMode(.template)
//                .foregroundColor(Color("darkGreen"))
                .frame(width: 200, height: 200)
                .padding()
                .cornerRadius(10)
//                .overlay(Circle()
//                            .stroke(Color("officialGreen"), lineWidth: 2))
                .shadow(radius: 10)

            
            Text("There are no items yet in the database. To start adding, please go to the 'Warranties' tab.")
                .font(.system(size: 22))
                .multilineTextAlignment(.center)
                .foregroundColor(Color("darkGreen"))
                .foregroundColor(Color.white)
                .padding()

            
        }
        .padding()
        .clipShape(Rectangle())
        .background(Color("officialGreen").opacity(0.5))
        .cornerRadius(20)
        .padding([.horizontal], 10)


        
    }
}

struct DashboardNoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardNoItemsView()
    }
}
