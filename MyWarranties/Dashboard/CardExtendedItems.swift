import SwiftUI

struct ExtendedWarrantyCard {
    let itemsCount: Int
    let itemsSum: Double
    let itemsValid: Int
    let itemsExpired: Int
}

struct CardExtendedItems: View {
    
    let cardData: ExtendedWarrantyCard
        
    var body: some View {
        
        VStack {
            
            Text("Extended Warranty")
                .font(.system(size: 30))
                .fontWeight(.semibold)
                .foregroundColor(Color("darkGreen"))
                .lineLimit(3)
                .padding([.bottom, .top], 20)
            
            VStack {

                HStack {
                    
                    Spacer()
                    
                    VStack(alignment: .center) {

                        Text("\(cardData.itemsCount)")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(Color("darkGreen"))
                        
                        Text(cardData.itemsCount > 1 ? "Items" : "Item")
                            .foregroundColor(Color("darkGreen"))
                        
                    }
                    .padding(.top, 5)
                    .padding(.horizontal, 5)
                    .padding(.bottom, 5)
                    
                    Spacer()
                    
                    VStack(alignment: .center) {


                        Text("\(cardData.itemsSum.stringValue())")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(Color("darkGreen"))

                        Text("Extended Warranties")
                            .foregroundColor(Color("darkGreen"))
                            .textCase(.none)


                    }
                    
                    Spacer()

                }
                .frame(maxWidth: .infinity)
                .background(Color("officialGreen").opacity(0.6))
                .clipShape(Rectangle())
                .cornerRadius(10)
                .padding([.horizontal], 20)

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

                        Text("\(cardData.itemsValid)")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color("darkGreen"))
                        
//                        Text(cardData.itemsValid > 1 ? "Items" : "Item")
//                            .foregroundColor(Color("darkGreen"))
                        
                        Text("Valid")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color("darkGreen"))
                            .padding(.bottom, 10)

                    }
                    .frame(maxWidth: .infinity)
                    .background(Color("officialGreen").opacity(0.6))
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                    .padding(.top, 10)

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

                        Text("\(cardData.itemsExpired)")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color("darkGreen"))
                        
//                        Text(cardData.itemsExpired > 1 ? "Items" : "Item")
//                            .foregroundColor(Color("darkGreen"))
                        
                        Text("Expired")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color("darkGreen"))
                            .padding(.bottom, 10)

                    }
                    .frame(maxWidth: .infinity)
                    .background(Color("officialGreen").opacity(0.6))
                    .clipShape(Rectangle())
                    .cornerRadius(10)
                    .padding(.top, 10)

                    Spacer()
                    
                }
                .padding([.bottom, .horizontal], 10)
                .padding(.top, 0)


            }
            
            Spacer()
                .frame(height: 10)
            
            
        }
        .clipShape(Rectangle())
        .background(Color("officialGreen").opacity(0.5))
        .cornerRadius(20)
        .padding([.horizontal], 10)
        
    }
}

struct CardExtendedItems_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardExtendedItems(cardData: ExtendedWarrantyCard(itemsCount: 3, itemsSum: 500.0, itemsValid: 1, itemsExpired: 2))
            CardExtendedItems(cardData: ExtendedWarrantyCard(itemsCount: 6, itemsSum: 900.0, itemsValid: 4, itemsExpired: 2))
                .preferredColorScheme(.dark)
        }
    }
}
