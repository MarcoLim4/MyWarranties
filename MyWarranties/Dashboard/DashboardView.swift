import SwiftUI
import CoreData

struct DashboardView: View {
        
    static let tag: String? = "Dashboard"
    
//    @EnvironmentObject var dataController: DataController
    
    let products : FetchRequest<Products>
    let extended : FetchRequest<Products>

    let photos   : FetchRequest<Photos>

    init() {

        let request: NSFetchRequest<Products> = Products.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Products.productName, ascending: false)]
        products = FetchRequest(fetchRequest: request)

        request.predicate = NSPredicate(format: "extendedWarranty = true")
        extended = FetchRequest(fetchRequest: request)

        let requestImages: NSFetchRequest<Photos> = Photos.fetchRequest()
        requestImages.sortDescriptors = [NSSortDescriptor(keyPath: \Photos.comments, ascending: false)]
        photos = FetchRequest(fetchRequest: requestImages)

    }
    
    var body: some View {

        if products.wrappedValue.count > 0 {

            ScrollView {

                VStack {

                    VStack(alignment: .center) {
                        
                        Text("Your Warranties Board")
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                            .lineLimit(3)

                        Text("A look into all your items!")
                            .font(.footnote)

                    }
                    .padding(.bottom, 20)
                    
                    CardAllItems(cardData: getCard01Data())

                    CardExtendedItems(cardData: getCard02Data())
                    
                }
                .padding([.top, .bottom])

            }
            
        } else {
            
            DashboardNoItemsView()
            
        }
        
        
    }
    
    func getCard01Data() -> RegularWarrantyCard {

        let totalItems  = products.wrappedValue.count
        let sum         = products.wrappedValue.reduce(0) { $0 + ($1.value(forKey: "productPurchasedValue") as? Double ?? 0) }
        let totalPhotos = photos.wrappedValue.count

        
        let extendedValidItems = products.wrappedValue.filter { $0.warrantyExpiryDate != nil }
        let validTotalRecords  = extendedValidItems.filter { $0.warrantyExpiryDate ?? Date() >=  Date() }.count
        let expirTotalRecords  = extendedValidItems.filter { $0.warrantyExpiryDate ?? Date() < Date() }.count


        let viewData = RegularWarrantyCard(productsCount: totalItems, productsSum: sum, productsPhotosCount: totalPhotos,
                                           productsValid: validTotalRecords, productsExpired: expirTotalRecords)

        return viewData

    }

    func getCard02Data() -> ExtendedWarrantyCard {

        let totalItems = extended.wrappedValue.count
        let sum        = extended.wrappedValue.reduce(0) { $0 + ($1.value(forKey: "extendedWarrantyCost") as? Double ?? 0) }

        
        let extendedValidItems = extended.wrappedValue.filter { $0.extendedWarrantyExpiryDate != nil }
        let validTotalRecords  = extendedValidItems.filter { $0.extendedWarrantyExpiryDate ?? Date() >=  Date() }.count
        let expirTotalRecords  = extendedValidItems.filter { $0.extendedWarrantyExpiryDate ?? Date() < Date() }.count


        let viewData = ExtendedWarrantyCard(itemsCount: totalItems, itemsSum: sum, itemsValid: validTotalRecords, itemsExpired: expirTotalRecords)

        return viewData
    }
        
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
