//
//  CardAllItems.swift
//  MyWarranties
//
//  Created by Marco Lima on 2021-04-21.
//

import SwiftUI

struct CardAllItems: View {
    
    
    var body: some View {
        
        VStack {
            
            Text("Number of Items ")
                .font(.system(size: 35))
                .fontWeight(.bold)
                .foregroundColor(Color("darkGreen"))
                .lineLimit(3)
                .padding([.bottom, .top], 20)
                .shadow(radius: 15)
            
            HStack {
                
                Spacer()
                
                VStack(alignment: .center) {

                    Text("03")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .foregroundColor(Color("darkGreen"))
                    
                    Text("Warranties")
                        .foregroundColor(Color("darkGreen"))
                    
                }
                .padding(.top, 5)
                .padding(.horizontal, 5)
                .padding(.bottom, 5)
                
                Spacer()
                
                VStack(alignment: .center) {


                    Text("$ 23,000.00")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .foregroundColor(Color("darkGreen"))

                    Text("Worth")
                        .foregroundColor(Color("darkGreen"))
                        .textCase(.none)


                }
                
                Spacer()

            }
            .padding(.all, 10)
            .background(Color("darkGreen").opacity(0.6))
            
        }
        
    }
}

struct CardAllItems_Previews: PreviewProvider {
    static var previews: some View {
        CardAllItems()
    }
}
