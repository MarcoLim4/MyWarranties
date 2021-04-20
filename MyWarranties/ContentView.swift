import SwiftUI

// tabs...
// Image Names...
var tabs = ["home", "warranty", "settings"]

struct ContentView: View {
    
    var body: some View {
        
        NavigationView{
            
            CustomTabView()
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

