import CoreData
import SwiftUI

class DataController: ObservableObject {

    let container: NSPersistentCloudKitContainer

    static var preview: DataController = {
        
        let dataController = DataController(inMemory: true)
        let viewContext = dataController.container.viewContext

        do {
            try dataController.createSampleData()
        } catch {
            fatalError("Fatal error creating preview: \(error.localizedDescription)")
        }

        return dataController
    }()

    init(inMemory: Bool = false) {
        
        container = NSPersistentCloudKitContainer(name: "WarrantyDB")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
    }

    func createSampleData() throws {

        let viewContext = container.viewContext
        
        for item in 1...2 {

            let wItem = Products(context: viewContext)
            
            wItem.productName           = "Washing Machine \(item)"
            wItem.productBrand          = "Brand Name"
            wItem.productSerial         = "0123"
            wItem.productPurchasedDate  = Date()
            wItem.warrantyType          = "Some Type"
            wItem.warrantyLength        = 12  // In months ????
            wItem.setReminder           = true
            wItem.productPurchasedValue = 2000
            
            wItem.photos = []
                        
            for photoNumber in 1...2 {
                
                let photos = Photos(context: viewContext)
                
                photos.comments = "Photo \(photoNumber)"
                let imageToSave = #imageLiteral(resourceName: "album-thumbnail")
                photos.itemPhoto = imageToSave.pngData()
                photos.products = wItem
                
            }
                        
        }

        try viewContext.save()

    }

    func save() {
        if container.viewContext.hasChanges {
            try? container.viewContext.save()
        }
    }

    func delete(_ object: NSManagedObject) {
        container.viewContext.delete(object)
    }

    func deleteAll() {

        let fetchRequest1: NSFetchRequest<NSFetchRequestResult> = Products.fetchRequest()
        let batchDeleteRequest1 = NSBatchDeleteRequest(fetchRequest: fetchRequest1)
        _ = try? container.viewContext.execute(batchDeleteRequest1)

        let fetchRequest2: NSFetchRequest<NSFetchRequestResult> = Photos.fetchRequest()
        let batchDeleteRequest2 = NSBatchDeleteRequest(fetchRequest: fetchRequest2)
        _ = try? container.viewContext.execute(batchDeleteRequest2)

    }

    func count<T>(for fetchRequest: NSFetchRequest<T>) -> Int {
        (try? container.viewContext.count(for: fetchRequest)) ?? 0
    }

    
}
