import SwiftUI

struct WarrantiesView: View {
    
    @StateObject var viewModel: ViewModel
    
    let colors = ["yellow", "green", "orange", "blue", "cyan", "purple", "pink"]
    
    init(dataController: DataController) {
        
        // Dependency injection here
        let viewModel = ViewModel(dataController: dataController)
        _viewModel = StateObject(wrappedValue: viewModel)
        
    }
    
    var body: some View {
        
        VStack {
            
            VStack {
                
                Text("My Warranties")
                    .font(.largeTitle)
                    .fontWeight(.bold)
//                    .padding(.bottom, 0)
                    .padding(.top, 20)

                Rectangle()
                    .frame(height: 0.5)
                    .foregroundColor(.lightGray)
                    .padding(.bottom, 0)
                
            }
            .frame(height: 30)
            .padding(.bottom, 30)
            .shadow(color: Color.black.opacity(0.08), radius: 5, x: 5, y: 5)
            
            ScrollView(.vertical, showsIndicators: true) {
                
                VStack(alignment: .leading) {
                                        
                    ForEach(viewModel.products) { product in
                        
                        NavigationLink(destination: WarrantyEditView(product: product)) {

                            ZStack(alignment: .leading) {
                                
                                HStack(alignment: .center, spacing: 10) {

                                    Image(product.categoryImage)
                                        .resizable()
                                        .renderingMode(.template)
                                        .foregroundColor(Color("fontTitle"))
                                        .frame(width: 30, height: 30)
                                        .padding()
                                        .cornerRadius(10)
                                                .overlay(Circle()
                                                            .stroke(Color("officialGreen"), lineWidth: 2))
//                                                            .stroke(Color(colors.randomElement() ?? "darkGreen"), lineWidth: 2))
                                                .shadow(radius: 10)

                                    VStack(alignment: .leading) {

                                        Text(product.productName ?? "")
                                            .font(.callout)
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color("fontTitle"))
                                        

                                        Text(product.productBrand ?? "")
                                            .font(.system(size: 14))
                                            .fontWeight(.light)
                                            .foregroundColor(Color("fontTitle"))

                                    }
                                    
                                    Spacer()

                                }
                                .frame(maxWidth: .infinity)
                                .padding([.bottom, .top, .leading, .trailing], 15)
                                .background(Color("cellBackground").opacity(0.75))
                                .cornerRadius(20)
                                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 5, y: 5)
                                .shadow(color: Color.black.opacity(0.08), radius: 5, x: -5, y: -5)

                                
//                                Divider()
                                
                            }
//                            .frame(maxWidth: .infinity)


                            
                        }
                        .padding(.top, 10)
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding([.leading, .trailing], 20)
                .padding(.bottom, 100)
                
                
            }
            
            
        }
        .onDisappear(perform: viewModel.dataController.save)
        
        
        
//        .preferredColorScheme(.light)
        
        
            
//        }
////        .preferredColorScheme(.dark)
//        .accentColor(.white)
//        .background(Color("darkGreen"))
//        .onDisappear(perform: viewModel.dataController.save)
//        .navigationViewStyle(StackNavigationViewStyle())
//        .edgesIgnoringSafeArea(.all)
        
    }
    
}

struct Warranties_Previews: PreviewProvider {
    static var previews: some View {
        WarrantiesView(dataController: DataController.preview)
    }
}
