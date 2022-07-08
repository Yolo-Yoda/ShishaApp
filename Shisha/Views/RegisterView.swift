import SwiftUI

struct RegisterView: View {
    
    @State private var enterOrRegister: Bool = true
    var body: some View {
        VStack {
            Label("", image: "Logo")
                .frame(width: 182, height: 182)
                .background(Color("MainColor"))
                .cornerRadius(182/2)
            HStack {
                VStack {
                    Button(action: {
                        enterOrRegister.toggle()
                    }, label: {
                        Text("Войти")
                            .font(.custom("FuturaPT-Book",size: 13))
                            .foregroundColor(enterOrRegister ? Color.black : Color("Gray"))
                    })
                        .padding(.vertical, 0)
                    Label("", image: "")
                        .frame(width: 72, height: 2)
                        .background(enterOrRegister ? Color("Violent") : Color.white)
                }
                Spacer()
                VStack {
                    Button(action: {
                        enterOrRegister.toggle()
                    }, label: {
                        Text("Зарегистрироваться")
                            .font(.custom("FuturaPT-Book",size: 13))
                            .foregroundColor(enterOrRegister ? Color("Gray") : Color.black)
                    })
                        .padding(.vertical, 0)
                    Label("", image: "")
                        .frame(width: 154, height: 2)
                        .background(enterOrRegister ? Color.white : Color("Violent"))
                }
            }.frame(width: 290, height: 53)
                .padding(.vertical, 10)
            VStack {
                if enterOrRegister {
                    EnterOnVIew()
                    EnterButtonView()
                        .padding(.vertical, 30)
                        
                }
                else {
                    RegisterOnView()
                    RegisterButtonView()
                        .padding(.vertical, 30)
    
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color.white)
        
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

