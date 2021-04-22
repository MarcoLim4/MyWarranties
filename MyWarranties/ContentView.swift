import SwiftUI

struct ContentView: View {
  
    @SceneStorage("selectedView") var selectedView: String?
    @EnvironmentObject var dataController: DataController
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {

        TabView(selection: $selectedView) {
            
            DashboardView()
                .tag(DashboardView.tag)
                .tabItem {
                    Image("home")
                        .renderingMode(.template)
                        .foregroundColor(Color("fontTitle"))
                    Text("Home")
                }

            WarrantiesView(dataController: dataController)
                .tag(WarrantiesView.tag)
                .tabItem {                    
                    Image("shield")
                        .renderingMode(.template)
                        .foregroundColor(Color("fontTitle"))

                    Text("Warranties")
                }

            SettingsView()
                .tag(SettingsView.tag)
                .tabItem {
                    Image("settings")
                        .renderingMode(.template)
                        .foregroundColor(Color("fontTitle"))

                    Text("Settings")
                }

            
        }
        .accentColor(Color("officialGreen"))

    }
    
    
//    var body: some View {
//
//        NavigationView{
//
//            CustomTabView()
//                .navigationTitle("")
//                .navigationBarTitleDisplayMode(.inline)
//                .navigationBarHidden(true)
//        }
//
//    }
//
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

