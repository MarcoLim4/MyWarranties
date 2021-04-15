//
//  WarrantyEditView.swift
//  MyWarranties
//
//  Created by Marco Lima on 2021-04-13.
//

import SwiftUI

struct WarrantyEditView: View {
    
    
    let product: Products
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var dataController: DataController
    
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var imagePickerSource = PhotoSource.library
    @State private var inputImage: UIImage?

    @State private var isShowingDeleteMessage = false

    // Data
    @State private var productName: String
    @State private var productBrand: String
    @State private var retailerName: String
    @State private var productPurchValue: Double
    @State private var purchaseDate: Date
    @State private var productSerial: String
    
    @State private var warrantType: String
    @State private var warrantyLength: Int16
    @State private var warrantyExpiryDate: Date
    @State private var warrantyCoverage: String
    
    @State private var extendedWarranty: Bool
    @State private var extendedWarrantyCost: Double
    @State private var extendedWarrantyExpiryDate: Date
    @State private var extendedWarrantyCoverage: String
    
    @State private var comments: String
    
    init(product: Products) {
        
        self.product = product
        
        _productName  = State(wrappedValue: product.productName ?? "")
        _productBrand = State(wrappedValue: product.productBrand ?? "")
        _retailerName = State(wrappedValue: product.retailerName ?? "")
        _productPurchValue = State(wrappedValue: product.productPurchasedValue)
        _purchaseDate = State(wrappedValue: product.productPurchasedDate ?? Date())
        _productSerial = State(wrappedValue: product.productSerial ?? "")
        
        
        _warrantType = State(wrappedValue: product.warrantyType ?? "")
        _warrantyLength = State(wrappedValue: product.warrantyLength )
        _warrantyExpiryDate = State(wrappedValue: product.warrantyExpiryDate ?? Date())
        _warrantyCoverage = State(wrappedValue: product.warrantyCoverage ?? "")
        
        _extendedWarranty = State(wrappedValue: product.extendedWarranty)
        _extendedWarrantyCost = State(wrappedValue: product.extendedWarrantyCost)
        _extendedWarrantyExpiryDate = State(wrappedValue: product.extendedWarrantyExpiryDate ?? Date())
        _extendedWarrantyCoverage = State(wrappedValue: product.extendedWarrantyCoverage ?? "")
        
        _comments = State(wrappedValue: product.comments ?? "")
        
    }
    
    
    var body: some View {
        
        Form {
            
            Section(header: Text("Product Details")) {
                
                HStack {
                    Text("Product Name")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    TextField("Product Name", text: $productName.onChange(update))
                        .font(.callout)
                }
                
                HStack {
                    
                    Text("Product Brand")
                        .font(.caption)
                        .foregroundColor(.gray)

                    TextField("Product Brand", text: $productBrand.onChange(update))
                        .font(.callout)
                    
                }
                
                HStack {
                    
                    Text("Retailer")
                        .font(.caption)
                        .foregroundColor(.gray)

                    TextField("Retailer Name", text: $retailerName.onChange(update))
                        .font(.callout)
                }
                
                HStack(alignment: .center) {
                    Text("Date Purchased")
                        .font(.caption)
                        .foregroundColor(.gray)

                    Spacer()

                    DatePicker("Select Date", selection: $purchaseDate, in: ...Date(), displayedComponents: .date)
                        .labelsHidden()
                        .datePickerStyle(CompactDatePickerStyle())
                        .frame(maxHeight: 400)
                        
                }
                
                HStack {
                    
                    Text("Product Serial Number")
                        .font(.caption)
                        .foregroundColor(.gray)

                    TextField("Serial Number", text: $productSerial.onChange(update))
                        .font(.callout)
                }

                
                HStack {
                    Text("Purchase Value")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    NumberEntryField(value: self.$productPurchValue.onChange(update))
                        .font(.callout)
                        .keyboardType(.decimalPad)
                                            
                }
                
            }
            
            Section(header: Text("Warranty Details")) {
                
                HStack {
                    Text("Warranty Type")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    TextField("Warranty Type", text: $warrantType.onChange(update))
                        .font(.callout)
                    
                }

                HStack {
                    Text("Warranty Coverage")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    TextField("Warranty Coverage", text: $warrantyCoverage.onChange(update))
                        .font(.callout)
                    
                }

                
                
                HStack(alignment: .center) {
                    Text("Expiry Date")
                        .font(.caption)
                        .foregroundColor(.gray)

                    Spacer()

                    DatePicker("Select Date", selection: $warrantyExpiryDate, displayedComponents: .date)
                        .labelsHidden()
                        .datePickerStyle(CompactDatePickerStyle())
                        .frame(maxHeight: 400)
                        
                }

            }
            
            Toggle("Extended Warranty", isOn: $extendedWarranty.animation())
            
            
            
            if extendedWarranty {
                
                Section(header: Text("Extended Warranty").textCase(.none) ) {
                 
                    HStack {
                        Text("Cost")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        NumberEntryField(value: self.$extendedWarrantyCost.onChange(update))
                            .font(.callout)
                            .keyboardType(.decimalPad)
                                                
                    }
                    
                    HStack(alignment: .center) {
                        Text("Expiry Date")
                            .font(.caption)
                            .foregroundColor(.gray)

                        Spacer()

                        DatePicker("Select Date", selection: $extendedWarrantyExpiryDate, displayedComponents: .date)
                            .labelsHidden()
                            .datePickerStyle(CompactDatePickerStyle())
                            .frame(maxHeight: 400)
                            
                    }
                    
                    HStack {
                        Text("Warranty Coverage")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        TextField("Warranty Coverage", text: $extendedWarrantyCoverage.onChange(update))
                            .font(.callout)
                        
                    }



                    
                }
                
            }
            
            
            Section(header: Text("Images")) {

                VStack {

                    Button(action: {
                        self.showingImagePicker.toggle()
                        self.imagePickerSource = .library
                    }) {
                        HStack(spacing:10) {
                            Image(systemName: "photo")
                                .foregroundColor(.green)
                            Text("Add Image from Library")
                                .font(.subheadline)
                                .foregroundColor(.green)
                        }
                    }

                }

                VStack {
                    ProductsImagesRow(thePhotos: product.allPhotos)
                        .frame(minHeight: 100)
                }

                VStack {

                    Button(action: {
                        self.showingImagePicker.toggle()
                        self.imagePickerSource = .camera
                    }) {
                        HStack(spacing:10) {
                            Image(systemName: "camera.circle")
                                .foregroundColor(.green)
                            Text("Take New Image")
                                .font(.subheadline)
                                .foregroundColor(.green)
                        }
                    }

                }
                .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                    ImagePicker(source: self.imagePickerSource, image: self.$inputImage)
                }

            }
//            .listRowBackground(Color("TabView"))
            .textCase(.none)
            .font(.headline)
            
            
            Section(header: Text("Comments")) {

                TextEditor(text: $comments.onChange(update))
                    .font(.callout)
                    .frame(minHeight: 100)
                    .multilineTextAlignment(.leading)

            }
//            .listRowBackground(Color("TabView"))
            .textCase(.none)
            .font(.headline)
            
            Section {

                Button(action: {
                    isShowingDeleteMessage.toggle()
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "trash")
                        Text("Delete Product")
                    }
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 45,
                       maxHeight: 45,
                       alignment: .center)
                .font(.headline)
                .foregroundColor(.red)
                .alert(isPresented: $isShowingDeleteMessage) {

                    Alert(
                        title: Text("Are you sure you want to delete this?"),
                        message: Text("By confirming this action, it will permanently delete the product and all associated data!"),
                        primaryButton: .destructive(Text("Yes, delete it!")) {

                            dataController.delete(product)
                            self.presentation.wrappedValue.dismiss()

                        },
                        secondaryButton: .cancel()
                    )

                }

            }
//            .listRowBackground(Color("TabView"))
            
            Section {
                EmptyView()
//                    .padding(.bottom, 150)
            }
            .padding(.bottom, 150)
            
            
            
        }
        .navigationBarTitle("Edit Product", displayMode: .automatic)
        .onDisappear(perform: update)
        
    }
    
    
    func update() {
        
        product.productName                = productName
        product.productBrand               = productBrand
        product.retailerName               = retailerName
        product.productPurchasedValue      = productPurchValue
        product.productPurchasedDate       = purchaseDate
        product.productSerial              = productSerial
        product.warrantyType               = warrantType
        product.warrantyLength             = Int16(warrantyLength)
        product.warrantyExpiryDate         = warrantyExpiryDate
        product.warrantyCoverage           = warrantyCoverage
        product.extendedWarranty           = extendedWarranty
        product.extendedWarrantyCoverage   = extendedWarrantyCoverage
        product.extendedWarrantyCost       = extendedWarrantyCost
        product.extendedWarrantyExpiryDate = extendedWarrantyExpiryDate
        
        product.comments = comments
        
    }
    
    func loadImage() {

        guard let inputImage = inputImage else {
            return
        }

        if imagePickerSource == .camera {
            print("Camera selected")

            let imageSaver = ImageSaver()
            imageSaver.writeToPhotoAlbum(image: inputImage)

        }

        let fixingOrientation = inputImage.fixOrientation()
        image = Image(uiImage: fixingOrientation)

        let newImage = Photos(context: managedObjectContext)
        newImage.products = product
        newImage.comments = "Details about this particular photo."
        newImage.itemPhoto = fixingOrientation.pngData()

        dataController.save()

    }
}

struct WarrantyEditView_Previews: PreviewProvider {
    static var previews: some View {
        WarrantyEditView(product: Products.example)
    }
}
