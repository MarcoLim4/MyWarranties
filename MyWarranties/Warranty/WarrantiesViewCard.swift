import SwiftUI

struct WarrantiesViewCard: View {
    
    let product: Products
    @State private var presentEditView = false
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {

                Image(systemName: "externaldrive.badge.plus")
                    .padding()
                    .cornerRadius(10)
                            .overlay(Circle()
                                        .stroke(Color("darkGreen"), lineWidth: 2))
                            .shadow(radius: 10)


                VStack(alignment: .leading) {

                    Text("Product Name") //Text(product.productName ?? "")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        .clipped()
                    

                    Text("Product Something") //                    Text(product.productBrand ?? "")
                        .font(.system(size: 14))
                        .fontWeight(.light)


                }
                
                Spacer()

            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.08), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.08), radius: 5, x: -5, y: -5)

        }
        
    }
    
}

struct WarrantiesViewCard_Previews: PreviewProvider {
    static var previews: some View {
        WarrantiesViewCard(product: Products.example)
    }
}


//
//
//
//                Button(action: {
//                    self.presentEditView.toggle()
//                }, label: {
//                    Image(systemName: "house")
//                        .foregroundColor(.blue)
//
//                })
//                .padding()
////                .fullScreenCover(isPresented: $presentEditView) {
//                .sheet(isPresented: $presentEditView) {
//                    WarrantyEditView(product: product)
//                }
