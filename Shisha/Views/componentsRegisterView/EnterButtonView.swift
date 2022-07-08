import SwiftUI

struct EnterButtonView: View {
    
    @State private var isMainAppViewShown: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                if AuthViewModel.shared.authItems.login == "1" &&
                    AuthViewModel.shared.authItems.password == "1" {
                    isMainAppViewShown.toggle()
                }
            }, label: {
                Text("Войти")
                    .font(.custom("FuturaPT-Book",size: 20))
                    .foregroundColor(Color.white)
            })
                .frame(width: 281, height: 45)
                .background(Color("Violent"))
                .cornerRadius(36)
                .padding(.vertical, 0)
            Button(action: {
                //GO TO APP
            }, label: {
                Text("Забыли пароль?")
                    .font(.custom("FuturaPT-Book",size: 13))
                    .foregroundColor(Color("Gray"))
            })
                .padding(.vertical, 2)
            
        }.fullScreenCover(isPresented: $isMainAppViewShown) {
            MainView()
        }
                
    }
}

struct EnterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        EnterButtonView()
    }
}
