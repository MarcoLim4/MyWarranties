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
    
    
    static var allRecords: [Products] {
        [Products]()
    }
    
    var allPhotos: [Photos] {
        let photosArray = photos?.allObjects as? [Photos] ?? []
        // Do any sorting here, if necessary
        return photosArray
    }
    
    static var example: Products {
        
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let product = Products(context: viewContext)
        
        product.productName           = "Your Product"
        product.productBrand          = "Brand Name"
        product.datePurchased         = Date()
        
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

