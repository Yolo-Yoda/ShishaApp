import SwiftUI

struct PasswordView: View {
    
    @State private var password = ""
    var body: some View {
        VStack{
            HStack{
                //ЗАМЕНА КАРТИНКИ
                Image(systemName: "star.fill")
                    .foregroundColor(Color("Violent"))
                    .frame(width: 13.5, height: 13.5)
                SecureField("Пароль", text: $password)
                    .font(.custom("FuturaPT-Book",size: 13))
                    .foregroundColor(Color("Gray"))
                    .padding(.horizontal, 6)
                    .onChange(of: password, perform: { value in
                        AuthViewModel.shared.authItems.password = value
                    })
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color("Gray213"))
                        .frame(width: 13.5, height: 13.5)
                })
            }
            
            Label("", image: "")
                .frame(width: 280, height: 2)
                .background(Color("Gray224"))
        }.frame(width: 280, height: 40)
    }
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView()
    }
}
