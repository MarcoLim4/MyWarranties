//
//  Products+CoreData.swift
//  MyWarranties
//
//  Created by Marco Lima on 2021-04-13.
//

import Foundation
import CoreData
import SwiftUI



extension Products {
    
    var prodName: String { productName ?? "" }
    
    
    var categoryImage: String { productCategoryImage ?? "01-Computer" }
    
    
    static var allRecords: [Products] {
        [Products]()
    }
    
    var allPhotos: [Photos] {
        let photosArray = photos?.allObjects as? [Photos] ?? []
        // Do any sorting here, if necessary
        return photosArray
    }
    
    var warrantyTypes: [String] {
        let types = ["Appliances", "Electronics", "House Repairs", "Boats", "Bicycles", "Cars", "Sporting Goods"]
        return types.sorted() + ["Other Services"]  // Sorting all the others and keeping Other Services at the End
    }

    
    
//MARK: Sample Data
    
    static var example: Products {
        
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let product = Products(context: viewContext)
        
        product.productName           = "Your Product"
        product.productBrand          = "Brand Name"
        product.productPurchasedDate  = Date()
        
        return product
        
    }
    
    static var photosSample: [Photos] {

        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        var someItems = [Photos]()

        for index in 1...7 {

            let newImage = Photos(context: viewContext)
            newImage.itemPhoto    = UIImage(named: "image0\(index).png")?.pngData()
            newImage.comments = "image \(index)"

            someItems.append(newImage)

        }
        
        return someItems as [Photos]

    }
    
    static var singlePhotoSample: Photos {

        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext

        let newImage = Photos(context: viewContext)
        newImage.itemPhoto    = UIImage(named: "image05.png")?.pngData()
        newImage.comments = "Comments about image 05."

        return newImage

    }
    
    
  
    
}

