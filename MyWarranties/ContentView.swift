import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dataController: DataController
    
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        
        TabBar()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
