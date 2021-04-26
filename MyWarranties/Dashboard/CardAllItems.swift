import SwiftUI

struct RegularWarrantyCard {
    let productsCount: Int
    let productsSum: Double
    let productsPhotosCount: Int
    let productsValid: Int
    let productsExpired: Int
}

struct CardAllItems: View {
    
    let cardData: RegularWarrantyCard
    
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

                HStack {
                    
                    Text("\(cardData.productsCount)")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color("darkGreen"))
                        .foregroundColor(Color.white)
//                        .padding(.horizontal)
                    
                    Text(cardData.productsCount > 1 ? "Warranties" : "Warranty")
                        .foregroundColor(Color("darkGreen"))
                        .foregroundColor(Color.white)

                }
                .padding(.horizontal)
                
                HStack {
                    
                    Text("\(cardData.productsPhotosCount)")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color("darkGreen"))
                        .foregroundColor(Color.white)
//                        .padding(.horizontal)

                    Text(cardData.productsPhotosCount > 1 ? "Images" : "Image")
                        .foregroundColor(Color("darkGreen"))
                        .foregroundColor(Color.white)

                }
                .padding(.horizontal)

                
            }
            
            

            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("darkGreen"))
                .padding(.horizontal)
            
            HStack {
                
                Spacer()
                
                VStack(alignment: .center) {


                    Text("\(cardData.productsSum.stringValue())")
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
            
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("darkGreen"))
                .padding(.horizontal)

            
            Text("Regular Warranty")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color("darkGreen"))
                .foregroundColor(Color.white)
                .lineLimit(3)
//                .padding([.bottom, .top], 5)
                .shadow(radius: 15)

            
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

                    Text("\(cardData.productsValid)")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color("darkGreen"))
                    
//                    Text(cardData.productsValid > 1 ? "Items" : "Item")
//                        .foregroundColor(Color("darkGreen"))
                    
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

                    Text("\(cardData.productsExpired)")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color("darkGreen"))
                    
//                    Text(cardData.productsExpired > 1 ? "Items" : "Item")
//                        .foregroundColor(Color("darkGreen"))
                    
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
        .clipShape(Rectangle())
        .background(Color("officialGreen").opacity(0.5))
        .cornerRadius(20)
        .padding([.horizontal], 10)

        
    }
}

struct CardAllItems_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardAllItems(cardData: RegularWarrantyCard(productsCount: 10,
                                                       productsSum: 2000.00,
                                                       productsPhotosCount: 2,
                                                       productsValid: 1,
                                                       productsExpired: 2))
                .preferredColorScheme(.light)
            CardAllItems(cardData: RegularWarrantyCard(productsCount: 2,
                                                       productsSum: 6000.00,
                                                       productsPhotosCount: 12,
                                                       productsValid: 5,
                                                       productsExpired: 0))
                .preferredColorScheme(.dark)
        }
            
    }
}
