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

                        VStack(alignment: .leading) {
                            
                            Text("\(product.productName ?? "")")
                                .font(.title)
                            
                            Text("\(product.productBrand ?? "")")
                            
                            
                            Text("\(product.retailerName ?? "")")
                            
                            Text("Purchased on: \(product.datePurchased ?? Date(), formatter: DateHelper.dateFormatLong)")
                                .font(.footnote)

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
