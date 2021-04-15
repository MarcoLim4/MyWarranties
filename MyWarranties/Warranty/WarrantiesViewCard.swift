import SwiftUI

struct WarrantiesViewCard: View {
    
    let product: Products
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
//            Image(systemName: "externaldrive.badge.plus")
//                .padding()
//                .cornerRadius(10)
//                        .overlay(Circle()
//                                    .stroke(Color("darkGreen"), lineWidth: 2))
//                        .shadow(radius: 10)

            
            HStack {

                Image(systemName: "externaldrive.badge.plus")
                    .padding()
                    .cornerRadius(10)
                            .overlay(Circle()
                                        .stroke(Color("darkGreen"), lineWidth: 2))
                            .shadow(radius: 10)


                VStack(alignment: .leading) {

                    Text(product.productName ?? "")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                    

                    Text(product.productBrand ?? "")
                        .font(.system(size: 14))
                        .fontWeight(.light)


                }

            }
            .padding([.top, .horizontal, .vertical, .leading])
            
        }
        
    }
    
}

struct WarrantiesViewCard_Previews: PreviewProvider {
    static var previews: some View {
        WarrantiesViewCard(product: Products.example)
    }
}
