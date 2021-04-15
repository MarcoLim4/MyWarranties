import SwiftUI

struct TabBar: View {

    @State private var current = "Warranties"
    @EnvironmentObject var dataController: DataController
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            TabView(selection: $current) {

                DashboardView()
                    .tag("Home")
                
                WarrantiesView(dataController: dataController)
                    .tag("Warranties")

                SettingsView()
                    .tag("Settings")
                

            }
            
            HStack(spacing: 0){
                
                // TabButton...

                TabButton(title: "Home", image: "home", selected: $current)
                
                Spacer(minLength: 0)
                
                TabButton(title: "Warranties", image: "warranty", selected: $current)
                
                Spacer(minLength: 0)
                
                TabButton(title: "Settings", image: "settings", selected: $current)
                
                Spacer(minLength: 0)
                
                
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color("tabbarColor"))
            .clipShape(Capsule())
            .padding(.horizontal, 25)

        }
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
