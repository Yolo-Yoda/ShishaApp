import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var singUpGoogle: GoogleAuthentificationViewModel
    
    var body: some View {
        AuthView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
