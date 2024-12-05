import CoreData
import Foundation
//import SwiftUI       // Hummmmm

extension WarrantiesView {

    class ViewModel: NSObject, ObservableObject, NSFetchedResultsControllerDelegate {

        let dataController: DataController
        let request: NSFetchRequest<Products> = Products.fetchRequest()

        private var productsController: NSFetchedResultsController<Products>

        @Published var products = [Products]()
        @Published var filteredProducts: [Products] = []
        @Published var searchText = ""

        init(dataController: DataController) {

            self.dataController = dataController

            //            let request: NSFetchRequest<Products> = Products.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(keyPath: \Products.productName, ascending: false)]//,
            //                                       NSSortDescriptor(keyPath: \Products.productBrand, ascending: true)]

            // leaving this here so we can use later if we need to filter somehow
            //            request.predicate = NSPredicate(format: "criteria = filter", argument)

            productsController = NSFetchedResultsController(fetchRequest: request,
                                                            managedObjectContext: dataController.container.viewContext,
                                                            sectionNameKeyPath: nil,
                                                            cacheName: nil)
            super.init()
            productsController.delegate = self

            do {
                try productsController.performFetch()
                products = productsController.fetchedObjects ?? []
                filteredProducts = products
            } catch {
                print("Error fetching products!!")
            }

        }

        func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {

            if let newProducts = controller.fetchedObjects as? [Products] {
                products = newProducts
            }

        }

        func addNewProduct() {

            let newProduct = Products(context: dataController.container.viewContext)

            newProduct.productID                  = UUID()
            newProduct.productName                = "_ New Product _"
            newProduct.productBrand               = "_ Brand Name _"
            newProduct.productPurchasedDate       = Date()
            newProduct.warrantyExpiryDate         = Date()
            newProduct.extendedWarrantyExpiryDate = Date()
            newProduct.warrantyReminderNotice     = "5 days"


            newProduct.productCategoryImage       = "01-Computer"

            dataController.save()

            refreshFetch()

        }

        /*
         I don't like much the way I'm doing this but...
         Maybe later I can try to find a way of just changing the sort order on the Array of Data instead of doing another Fetch
         ... or maybe this is it. Lucky we are just sorting local data, which is super fast. Still.... no too happy!
         */

        func refreshFetch() {

            let sortOrder = UserDefaults.standard.string(forKey: "ProductSortOrder")

            switch sortOrder {
            case Constants.SortingKeys.sortByProductName.rawValue:
                request.sortDescriptors = [NSSortDescriptor(keyPath: \Products.productName, ascending: true)]
            case Constants.SortingKeys.sortByBrandName.rawValue:
                request.sortDescriptors = [NSSortDescriptor(keyPath: \Products.productBrand, ascending: true)]
            case Constants.SortingKeys.sortByExpiryDate.rawValue:
                request.sortDescriptors = [NSSortDescriptor(keyPath: \Products.warrantyExpiryDate, ascending: true)]//,
            default:
                request.sortDescriptors = [NSSortDescriptor(keyPath: \Products.extendedWarrantyExpiryDate, ascending: true)]//,
            }

            self.productsController = NSFetchedResultsController(fetchRequest: request,
                                                                 managedObjectContext: dataController.container.viewContext,
                                                                 sectionNameKeyPath: nil,
                                                                 cacheName: nil)

            do {
                try productsController.performFetch()
                products = productsController.fetchedObjects ?? []
                filteredProducts = products
            } catch {
                print("Error fetching products!!")
            }

        }

        func filterContent() {

            let lowercasedSearchText = searchText.lowercased()

            if searchText.count > 0 {

                var matchingProducts: [Products] = []

                products.forEach { product in

                    // for now, sarching only on prod Name
                    let searchContent = product.prodName

                    if searchContent.lowercased().range(of: lowercasedSearchText, options: .regularExpression) != nil {
                        matchingProducts.append(product)
                    }
                }

                filteredProducts = matchingProducts

            } else {
                filteredProducts = products
            }
        }


    }
}


