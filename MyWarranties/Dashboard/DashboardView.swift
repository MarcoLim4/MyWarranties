import SwiftUI

struct DashboardView: View {
        
    static let tag: String? = "Dashboard"
    
    @EnvironmentObject var dataController: DataController
    
    var body: some View {

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
                
                CardAllItems()

                CardExtendedItems()
                
            }
            .padding([.top, .bottom])

        }
        
    }
        
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
