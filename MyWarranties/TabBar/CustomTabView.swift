import SwiftUI

struct CustomTabView : View {

    @EnvironmentObject var dataController: DataController
    @State var selectedTab = "Home"
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets

    var body: some View{

        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {

            // Using Tab View For Swipe Gestures...
            // if you dont need swipe gesture tab change means just use switch case....to switch views...

            TabView(selection: $selectedTab) {

                DashboardView()
                    .tag("Home")

                WarrantiesView(dataController: dataController)
                    .tag("Warranties")

                SettingsView()
                    .tag("Settings")

            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)
            // for bottom overflow...

            HStack(spacing: 10) {

                //                Spacer(minLength: 0)
                TabButton2(title: "Home", image: "home", selectedTab: $selectedTab)

                Spacer(minLength: 0)

                TabButton2(title: "Warranties",image: "shield", selectedTab: $selectedTab)

                Spacer(minLength: 0)

                TabButton2(title: "Settings",image: "settings", selectedTab: $selectedTab)

                
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 5)
            .background(Color("officialGreen"))
            .clipShape(Rectangle())
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
            .padding(.horizontal, 10)
            // for smaller iphones....
            // elevations...
            .padding(.bottom, edge!.bottom == 0 ? 20 : 0)

            // ignoring tabview elevation....
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))

    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
