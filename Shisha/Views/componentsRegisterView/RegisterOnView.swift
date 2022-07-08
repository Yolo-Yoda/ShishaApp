import SwiftUI

struct RegisterOnView: View {
    
    
    
    @State private var login = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: true){
            VStack{
                VStack{
                    GoogleView()
                    NameSurnameView()
                    EmailView()
                    LoginView()
                    DateOfBirthView()
                    PasswordView()
                    SecondPasswordFillVIew()
                }
            }
        }
        .frame(width: 281, height: 6*40, alignment: .bottom)
    }
    
}

struct RegisterOnView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterOnView()
    }
}
