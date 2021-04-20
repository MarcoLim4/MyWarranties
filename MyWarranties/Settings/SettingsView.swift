//
//  SettingsViewController.swift
//  MyWarranties
//
//  Created by Marco Lima on 2021-04-13.
//

import SwiftUI

struct SettingsView: View {
    
    let categories = ["01-Computer",
                      "02-Electronics",
                      "03-Computer",
                      "04-Laptop",
                      "06-Phone",
                      "07-TV",
                      "08-Speaker",
                      "09-Control",
                      "10-Headphones",
                      "11-Microwave",
                      "12-VirtualGogles",
                      "13-Mic",
                      "14-Speaker",
                      "15-Stove",
                      "16-Washer",
                      "17-Fridge",
                      "18-Microwave",
                      "19-Radio",
                      "20-HomeTheater",
                      "21-Projector",
                      "22-CoffeMaker",
                      "23-SlowCook",
                      "25-MiniBlender",
                      "26-Blender",
                      "27-Toaster",
                      "28-Kettle",
                      "29-Camera",
                      "30-Camera01",
                      "31-VideoRecorder",
                      "32-Games",
                      "33-BlowDryer",
                      "34-Vacuum",
                      "35-Iron",
                      "36-Drill",
                      "37-Fan",
                      "38-Printer",
                      "39-bicycle",
                      "40-Cars",
                      "41-SportingGoods",
                      "42-House",
                      "43-Motorcycle",
                      "44-Scooter",
                      "45-Tractor",
                      "46-Yatch"]
    
    
    @State private var imageName: String
    
    init() {
        _imageName = State(wrappedValue: "")
    }
    
    var body: some View {
        
        
//        VStack {
//
//            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 4),spacing: 20) {
//
//                ForEach(categories, id: \.self) { imageName in
//
//                    HStack {
//
//                        Button(action: {
//
//
//
//                        }, label: {
//                            Image(imageName)
//                                .resizable()
//                                .renderingMode(.template)
//                                .frame(width: 50, height: 50)
//                                .foregroundColor(.gray)
//                        })
////
////                        Text("\(imageName)")
////                            .font(.footnote)
//
//
//                    }
//
//
//                }
//
//
//
//            }
//            .padding()
//        }
        
        VStack {

            Form {

                Section(header: Text("Product Category") ) {

                    HStack {

                        Picker("Category Image", selection: $imageName) {

                            ForEach(categories, id: \.self) { imageName in

                                Image(imageName)
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 50, height: 50)
                                
                            }
                            .foregroundColor(.gray)

                        }
                        .pickerStyle(DefaultPickerStyle())

                    }


                }

            }


        }
        

        
        
    }
}

struct SettingsViewController_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
