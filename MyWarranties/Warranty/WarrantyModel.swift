import CoreData
import Foundation
//import SwiftUI       // Hummmmm

extension WarrantiesView {
    
    class ViewModel: NSObject, ObservableObject, NSFetchedResultsControllerDelegate {
        
        let dataController: DataController
        
        private let productsController: NSFetchedResultsController<Products>
        @Published var products = [Products]()
        
        init(dataController: DataController) {
            
            self.dataController = dataController
            
            let request: NSFetchRequest<Products> = Products.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(keyPath: \Products.productName, ascending: true),
                                       NSSortDescriptor(keyPath: \Products.productBrand, ascending: true)]
            
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
            
            newProduct.productName           = "Product Name"
            newProduct.productBrand          = "Brand Name"
            newProduct.datePurchased         = Date()

            dataController.save()

        }
        
        
    }
}