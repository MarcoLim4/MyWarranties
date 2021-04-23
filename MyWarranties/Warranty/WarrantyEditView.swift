import SwiftUI

struct WarrantyEditView: View {
    
    
    let product: Products
    let viewModel: WarrantiesView.ViewModel
    
    let categories = ["01-Computer", "02-Electronics", "03-Computer", "04-Laptop", "06-Phone", "07-TV",
                      "08-Speaker", "09-Control", "10-Headphones", "11-Microwave", "12-VirtualGogles",
                      "13-Mic", "14-Speaker", "15-Stove", "16-Washer", "17-Fridge", "18-Microwave",
                      "19-Radio", "20-HomeTheater", "21-Projector", "22-CoffeMaker", "23-SlowCook",
                      "25-MiniBlender", "26-Blender", "27-Toaster", "28-Kettle", "29-Camera",
                      "30-Camera01", "31-VideoRecorder", "32-Games", "33-BlowDryer", "34-Vacuum",
                      "35-Iron", "36-Drill", "37-Fan", "38-Printer", "39-bicycle", "40-Cars",
                      "41-SportingGoods", "42-House", "43-Motorcycle", "44-Scooter", "45-Tractor",
                      "46-Yatch"]

    
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var dataController: DataController
    
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var imagePickerSource = PhotoSource.library
    @State private var inputImage: UIImage?

    @State private var isShowingDeleteMessage = false
    @State private var showingNotificationsError = false

    // Data
    @State private var productName: String
    @State private var productBrand: String
    @State private var retailerName: String
    @State private var productPurchValue: Double
    @State private var purchaseDate: Date
    @State private var productSerial: String
    @State private var productCategoryImage: String
    
    @State private var warrantType: String
    @State private var warrantyLength: Int16
    @State private var warrantyExpiryDate: Date
    @State private var warrantyShowReminder: Bool
    @State private var warrantyReminderID: String
    @State private var warrantyCoverage: String
    
    @State private var extendedWarranty: Bool
    @State private var extendedWarrantyCost: Double
    @State private var extendedWarrantyExpiryDate: Date
    @State private var extendedShowReminder: Bool
    @State private var extendedWarrantyCoverage: String
    
    @State private var comments: String
    
    init(product: Products, viewModel: WarrantiesView.ViewModel) {
        
        self.product   = product
        self.viewModel = viewModel
        
        _productName  = State(wrappedValue: product.productName ?? "")
        _productBrand = State(wrappedValue: product.productBrand ?? "")
        _retailerName = State(wrappedValue: product.retailerName ?? "")
        _productPurchValue = State(wrappedValue: product.productPurchasedValue)
        _purchaseDate = State(wrappedValue: product.productPurchasedDate ?? Date())
        _productSerial = State(wrappedValue: product.productSerial ?? "")
        _productCategoryImage = State(wrappedValue: product.productCategoryImage ?? "")
                
        _warrantType = State(wrappedValue: product.warrantyType ?? "")
        _warrantyLength = State(wrappedValue: product.warrantyLength )
        _warrantyExpiryDate = State(wrappedValue: product.warrantyExpiryDate ?? Date())
        _warrantyShowReminder = State(wrappedValue: product.warrantyShowReminder)
        _warrantyReminderID = State(wrappedValue: product.warrantyReminderID ?? "NOID")
        _warrantyCoverage = State(wrappedValue: product.warrantyCoverage ?? "")
                
        _extendedWarranty = State(wrappedValue: product.extendedWarranty)
        _extendedWarrantyCost = State(wrappedValue: product.extendedWarrantyCost)
        _extendedWarrantyExpiryDate = State(wrappedValue: product.extendedWarrantyExpiryDate ?? Date())
        _extendedWarrantyCoverage = State(wrappedValue: product.extendedWarrantyCoverage ?? "")
        _extendedShowReminder = State(wrappedValue: product.extendedShowRemider)
        
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
                    
//                    FormattedTextField("Enter amount",value: productPurchValue, formatter: CurrencyTextFieldFormatter())
                    
                    NumberEntryField(value: self.$productPurchValue.onChange(update))
                        .font(.callout)
                        .keyboardType(.decimalPad)
                        
                                            
                }
                
            }
            .textCase(.none)
            .font(.headline)
            
            Section(header:
                        Text("Product Category")
                        .font(.headline)
                        .textCase(.none)) {

                HStack {

                    Picker("Category Image", selection: $productCategoryImage) {

                        ForEach(categories, id: \.self) { imageName in

                            Image(imageName)
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 50, height: 50)
                            
                        }
                        .foregroundColor(.gray)

                    }
                    .pickerStyle(DefaultPickerStyle())
                    .font(.footnote)

                }


            }
            
            Section(header:
                        Text("Warranty Details")
                        .textCase(.none)
                        .font(.headline)) {
                
                HStack {
                    
                    Picker("Warranty Type", selection: $warrantType.onChange(update)) {
                        
                        ForEach(product.warrantyTypes, id: \.self) { type in
                            Text("\(type)")
                        }
                        .foregroundColor(.gray)
                        
                    }
                    .font(.footnote)
                    .foregroundColor(.gray)
                    
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
                
                Toggle("Show Reminder", isOn: $warrantyShowReminder.animation())
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .alert(isPresented: $showingNotificationsError) {
                        Alert(
                            title: Text("Reminded Error"),
                            message: Text("There was a problem. Please check if you have notifications enabled."),
                            primaryButton: .default(Text("Check Settings"), action: showAppSettings),
                            secondaryButton: .cancel()
                        )
                    }

            }
            
            Toggle("Extended Warranty", isOn: $extendedWarranty.animation())
                .font(.footnote)
                .foregroundColor(.gray)
            
            if extendedWarranty {
                
                Section(header:
                            Text("Extended Warranty")
                            .textCase(.none)
                            .font(.headline)) {
                 
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
                    
                    Toggle("Show Reminder", isOn: $extendedShowReminder.animation())
                        .font(.footnote)
                        .foregroundColor(.gray)

                    
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
            .textCase(.none)
            .font(.headline)
            
            
            Section(header: Text("Comments")) {

                TextEditor(text: $comments.onChange(update))
                    .font(.callout)
                    .frame(minHeight: 100)
                    .multilineTextAlignment(.leading)

            }
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
                            viewModel.refreshFetch()
                            self.presentation.wrappedValue.dismiss()

                        },
                        secondaryButton: .cancel()
                    )

                }

            }
            .textCase(.none)
            .font(.headline)
            
            Section {
                EmptyView()
                    .padding(.bottom, 150)
            }
            .padding(.bottom, 150)
            
            
            
        }
        .navigationBarTitle("Edit Warranty", displayMode: .large)
//        .onDisappear(perform: updateReminders)

    }
    
    
    func update() {
        
        product.objectWillChange.send()
        
        product.productName                = productName
        product.productBrand               = productBrand
        product.retailerName               = retailerName
        product.productPurchasedValue      = productPurchValue
        product.productPurchasedDate       = purchaseDate
        product.productSerial              = productSerial
        product.productCategoryImage       = productCategoryImage
        
        product.warrantyType               = warrantType
        product.warrantyLength             = Int16(warrantyLength)
        product.warrantyExpiryDate         = warrantyExpiryDate
        product.warrantyShowReminder       = warrantyShowReminder
        product.warrantyCoverage           = warrantyCoverage
        
        product.extendedWarranty           = extendedWarranty
        product.extendedWarrantyCoverage   = extendedWarrantyCoverage
        product.extendedWarrantyCost       = extendedWarrantyCost
        product.extendedWarrantyExpiryDate = extendedWarrantyExpiryDate
        product.extendedShowRemider        = extendedShowReminder
        
        product.comments = comments
                
        if warrantyShowReminder {

            WarrantiesNotifications().addReminders(for: product) { success in

                if success == false {

                    // Not sure if I have to do anything here....
                    warrantyShowReminder = false
                    showingNotificationsError = true
                }
            }

        } else {
            WarrantiesNotifications().removeReminders(for: product)
        }
        
        
//        if warrantyShowReminder {
//            
//            if warrantyReminderID == "NOID" {
//                
//                WarrantiesReminders.askForPermission { success in
//
//                    WarrantiesReminders.addReminders(for: product) { success, eventId in
//                        
//                        if success {
//                            self.product.warrantyReminderID = eventId
//                        } else {
//                            print("No good sir")
//                        }
//                    }
//
//
//                }
//
//
//                
//                
//            }
//            
//        }

        
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
    
    func showAppSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }

        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl)
        }
    }
}

//struct WarrantyEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        WarrantyEditView(product: Products.example, viewModel: WarrantiesView.ViewModel)
//    }
//}
