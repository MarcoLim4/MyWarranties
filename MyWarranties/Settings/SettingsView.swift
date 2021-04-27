import SwiftUI

struct SettingsView: View {
    
    static let tag: String? = "Settings"
    
    @State private var showDisclaimer    = false
    @State private var showRemindersTool = false
    
    var body: some View {

        NavigationView {

            List {
                
                VStack(alignment: .leading) {

                    Button(action: {
                        self.showDisclaimer.toggle()
                    }) {
                        HStack(spacing:10) {
                            
                            Image(systemName: "doc.text.below.ecg")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(Color("darkGreen"))
                                .frame(width: 15, height: 15)
                                .padding()
                                .cornerRadius(10)
                                .overlay(Circle()
                                            .stroke(Color("officialGreen"), lineWidth: 2))
                                .shadow(radius: 10)
                            
                            Text("Disclaimer")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(Color("darkGreen"))
                                
                        }
                    }

                }
                .padding(.all, 10)
                .sheet(isPresented: $showDisclaimer) {
                    DisclaimerView()
                }

                VStack(alignment: .leading) {

                    Button(action: {
                        self.showRemindersTool.toggle()
                    }) {
                        HStack(spacing:10) {
                            
                            Image(systemName: "calendar.badge.minus")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(Color("darkGreen"))
                                .frame(width: 15, height: 15)
                                .padding()
                                .cornerRadius(10)
                                .overlay(Circle()
                                            .stroke(Color("officialGreen"), lineWidth: 2))
                                .shadow(radius: 10)
                            
                            Text("Reminders Tool")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(Color("darkGreen"))
                                
                        }
                    }

                }
                .padding(.all, 10)
                .sheet(isPresented: $showRemindersTool) {
                    RemindersToolView()
                }
                
            }
            .navigationTitle("Settings")

            
        }


    }

}

struct SettingsViewController_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}



// to be used in the Navigtaion View (Not sheet)
//{
 
//                    VStack(alignment: .leading) {
//
//                        NavigationLink(destination: RemindersToolView()) {
//
//                            HStack(spacing:10) {
//
//                                Image(systemName: "calendar.badge.minus")
//                                    .resizable()
//                                    .renderingMode(.template)
//                                    .foregroundColor(Color("darkGreen"))
//                                    .frame(width: 18, height: 18)
//                                    .padding()
//                                    .cornerRadius(10)
//                                    .overlay(Circle()
//                                                .stroke(Color("officialGreen"), lineWidth: 2))
//                                    .shadow(radius: 10)
//
//                                Text("Reminders Tool")
//                                    .font(.system(size: 20))
//                                    .fontWeight(.bold)
//                                    .foregroundColor(Color("darkGreen"))
//
//                            }
//
//
//                        }
//
//                    }
//                    .padding(.all, 10)
    
//}
