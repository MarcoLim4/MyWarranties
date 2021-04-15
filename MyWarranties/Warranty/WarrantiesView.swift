import SwiftUI

struct WarrantiesView: View {
    
    @StateObject var viewModel: ViewModel
    
//    let products: FetchRequest<Products>
    
    init(dataController: DataController) {
        
        // Dependency injection here
        let viewModel = ViewModel(dataController: dataController)
        _viewModel = StateObject(wrappedValue: viewModel)
        
    }

    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(viewModel.products) { product in
                

                    NavigationLink(destination: WarrantyEditView(product: product)) {

//                        WarrantiesViewCard(product: product)
                        
                        
                        VStack(alignment: .leading) {
                            
                            HStack {

                                Image(systemName: "seal")
                                    .resizable()
                                    .frame(width: 30, height: 30)
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
                            .padding(.all, 10)
                        }

                        
                    }

                    
                    
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Products")
            .toolbar {
                
                Button {
                    withAnimation {
                        viewModel.addNewProduct()
                    }
                    
                } label: {
                    Label("Add New Warranty", systemImage: "plus")
                }
                
            }
            
        }
        .padding(.top, 25)
//        .background(Color("Background"))
        .onDisappear(perform: viewModel.dataController.save)
        .navigationViewStyle(StackNavigationViewStyle())
        .edgesIgnoringSafeArea(.all)
        
    }
    
}

struct Warranties_Previews: PreviewProvider {
    static var previews: some View {
        WarrantiesView(dataController: DataController.preview)
    }
}
