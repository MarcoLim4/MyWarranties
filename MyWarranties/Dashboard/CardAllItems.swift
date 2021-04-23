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
                .foregroundColor(Color.white)
                .lineLimit(3)
                .padding([.bottom, .top], 20)
                .shadow(radius: 15)
            
            HStack {
                
                Spacer()
                
                VStack(alignment: .center) {

                    Text("03")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color("darkGreen"))
                        .foregroundColor(Color.white)
                    
                    Text("Warranties")
                        .foregroundColor(Color("darkGreen"))
                        .foregroundColor(Color.white)
                    
                }
                .padding(.top, 5)
                .padding(.horizontal, 5)
                .padding(.bottom, 5)
                
                Spacer()
                
                VStack(alignment: .center) {


                    Text("$ 23,000.00")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color("darkGreen"))
                        .foregroundColor(Color.white)

                    Text("Worth")
                        .foregroundColor(Color("darkGreen"))
                        .foregroundColor(Color.white)
                        .textCase(.none)


                }
                
                Spacer()

            }
            .padding(.all, 10)
//            .background(Color("darkGreen").opacity(0.6))
            
        }
        .clipShape(Rectangle())
        .background(Color("officialGreen").opacity(0.5))
        .cornerRadius(20)
        .padding([.horizontal], 10)

        
    }
}

struct CardAllItems_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardAllItems()
                .preferredColorScheme(.light)
            CardAllItems()
                .preferredColorScheme(.dark)
        }
            
    }
}
