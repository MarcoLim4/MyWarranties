//
//  CardExtendedItems.swift
//  MyWarranties
//
//  Created by Marco Lima on 2021-04-21.
//

import SwiftUI

struct CardExtendedItems: View {
    
    
    var body: some View {
        
        VStack {
            
            Text("Extended Warranty")
                .font(.system(size: 35))
                .fontWeight(.semibold)
                .foregroundColor(Color("darkGreen"))
                .lineLimit(3)
                .padding([.bottom, .top], 20)
            
            VStack {

                HStack {
                    
                    Spacer()
                    
                    VStack(alignment: .center) {

                        Text("3")
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                            .foregroundColor(Color("darkGreen"))
                        
                        Text("Items")
                            .foregroundColor(Color("darkGreen"))
                        
                    }
                    .padding(.top, 5)
                    .padding(.horizontal, 5)
                    .padding(.bottom, 5)
                    
                    Spacer()
                    
                    VStack(alignment: .center) {


                        Text("$ 3,000.00")
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                            .foregroundColor(Color("darkGreen"))

                        Text("Extended Warranties")
                            .foregroundColor(Color("darkGreen"))
                            .textCase(.none)


                    }
                    
                    Spacer()

                }
                .padding(.all, 10)
                .background(Color("darkGreen").opacity(0.6))
                

                HStack {
                    
                    Spacer()
                    
                    VStack {
                        
                        Image(systemName: "tag")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 45, height: 45)
                            .foregroundColor(Color.white)
                            .padding(.top, 10)
                            .padding(.bottom, 0)
                            .padding(.horizontal)

                        Text("2")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color("darkGreen"))
                        
                        Text("Items")
                            .foregroundColor(Color("darkGreen"))
                        
                        Text("Valid")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color("darkGreen"))

                    }
                    
                    Spacer()
                    
                    Divider()
                        .frame(width: 2, height: 150)

                    
                    Spacer()
                    
                    VStack {
                        
                        Image(systemName: "tag.slash")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 45, height: 45)
                            .foregroundColor(Color.red)
                            .padding(.top, 10)
                            .padding(.bottom, 0)
                            .padding(.horizontal)

                        Text("1")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color("darkGreen"))
                        
                        Text("Item")
                            .foregroundColor(Color("darkGreen"))
                        
                        Text("Expired")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color("darkGreen"))

                    }
//                    .background(Color("darkGreen").opacity(0.6))

                    Spacer()
                    
                }
                .padding(.all, 10)
                .background(Color("darkGreen").opacity(0.6))



            }
            
            
        }
    }
}

struct CardExtendedItems_Previews: PreviewProvider {
    static var previews: some View {
        CardExtendedItems()
    }
}
