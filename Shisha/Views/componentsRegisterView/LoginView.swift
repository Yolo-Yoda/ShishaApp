import SwiftUI

struct LoginView: View {
    
    @State private var login = ""
   
    var body: some View {
        VStack{
            HStack{
                //ЗАМЕНА КАРТИНКИ
                Image(systemName: "star.fill")
                    .foregroundColor(Color("Violent"))
                    .frame(width: 13.5, height: 13.5)
                TextField("Логин", text: $login)
                    .font(.custom("FuturaPT-Book",size: 13))
                    .foregroundColor(Color("Gray"))
                    .padding(.horizontal, 6)
                    .onChange(of: login, perform: { value in
                        AuthViewModel.shared.authItems.login = value
                    })
                    
            }
            Label("", image: "")
                .frame(width: 280, height: 2)
                .background(Color("Gray224"))
                
        }
        .frame(width: 280, height: 40)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
