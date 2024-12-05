import SwiftUI

struct WarrantiesView: View {

    static let tag: String? = "Warranties"

    @StateObject var viewModel: ViewModel
    @State private var showSearchBar = false
    @State private var sort = "5 Days"

    init(dataController: DataController) {

        // Dependency injection here
        let viewModel = ViewModel(dataController: dataController)
        _viewModel = StateObject(wrappedValue: viewModel)

        // So we can see the clear button on the search bar
        UITextField.appearance().clearButtonMode = .whileEditing

    }

    var body: some View {

        NavigationView {

            VStack {

                if viewModel.products.count > 0 && showSearchBar == true {

                    VStack(alignment: .leading) {

                        TextField("Search", text: $viewModel.searchText)
                            .font(.caption)
                            .frame(height: 10)
                            .padding()
                            .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.2662717301)))
                            .cornerRadius(10)
                            .onChange(of: viewModel.searchText) { text in
                                viewModel.filterContent()
                            }

                    }
                    .padding(.horizontal, 10)

                }



                List {

                    //                    ForEach(viewModel.filteredProducts.count > 1 ? viewModel.filteredProducts : viewModel.products) { product in
                    ForEach(viewModel.filteredProducts) { product in

                        NavigationLink(destination: WarrantyEditView(product: product, viewModel: viewModel)) {

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

                            }

                        }
                        .padding(.top, 10)

                    }
                    //                    .onDelete(perform: { indexSet in
                    //                        print(indexSet)
                    //                    })

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .navigationTitle("My Warranties")
                .toolbar {

                    ToolbarItemGroup(placement: .navigationBarLeading) {

                        if viewModel.products.count > 0 {

                            Menu {

                                Button("Product Name",         action: { setOrder(key: .sortByProductName) })
                                Button("Brand Name",           action: { setOrder(key: .sortByBrandName) })
                                Button("Expiry Date",          action: { setOrder(key: .sortByExpiryDate) })
                                Button("Extended Expiry Date", action: { setOrder(key: .sortByExtendedExpiryDate) })

                            } label: {

                                Image(systemName: "arrow.up.arrow.down")
                                    .renderingMode(.template)
                                    .foregroundColor(Color("officialGreen"))

                            }

                        }

                    }

                    ToolbarItemGroup(placement: .navigationBarTrailing) {

                        if viewModel.products.count > 0 {

                            Button {
                                withAnimation {
                                    viewModel.searchText = "" // clear search bar just in case
                                    showSearchBar.toggle()
                                }
                            } label: {
                                Image(systemName: "magnifyingglass.circle.fill")
                                    .renderingMode(.template)
                                    .foregroundColor(Color("officialGreen"))
                            }

                        }

                        Button {
                            withAnimation {
                                viewModel.searchText = "" // clear search bar just in case
                                viewModel.addNewProduct()
                            }
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .renderingMode(.template)
                                .foregroundColor(Color("officialGreen"))
                        }

                    }

                }

            }

        }
        .onDisappear(perform: viewModel.dataController.save)
        .navigationViewStyle(StackNavigationViewStyle())
        .edgesIgnoringSafeArea(.all)

    }

    func setOrder(key: Constants.SortingKeys) {

        UserDefaults.standard.setValue(key.rawValue as String, forKey: "ProductSortOrder")

        viewModel.refreshFetch()
    }


}

struct Warranties_Previews: PreviewProvider {
    static var previews: some View {
        WarrantiesView(dataController: DataController.preview)
    }
}
