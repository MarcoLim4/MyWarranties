import SwiftUI

struct DashboardView: View {
        
    static let tag: String? = "Dashboard"
    
    var body: some View {

        ScrollView {
            
            VStack {
                
                
                VStack(alignment: .center) {
                    
                    Text("Your Warranties Board")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
//                        .foregroundColor(Color("darkGreen"))
                        .lineLimit(3)

                    Text("A look on all your items!")
                        .font(.footnote)
//                        .foregroundColor(Color("darkGreen"))

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
