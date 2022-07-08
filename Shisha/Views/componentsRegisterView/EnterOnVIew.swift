import SwiftUI

struct EnterOnVIew: View {
    
    var body: some View {
        VStack{
            GoogleView()
            LoginView()
            PasswordView()
        }
    }
}

struct EnterOnVIew_Previews: PreviewProvider {
    static var previews: some View {
        EnterOnVIew()
    }
}
