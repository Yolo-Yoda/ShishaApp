import SwiftUI
import GoogleSignIn

struct AuthView: View {
    
    @State private var login = ""
    @State private var password = ""
    @State private var alllertMessage = ""
    @State private var confirmPassword = ""
    @State private var missPasswordEmail: String?
    @State private var showPassword: Bool = true
    @State private var isShowAllert: Bool = false
    @State private var enterOrRegister: Bool = true
    @State private var showSecondPassword: Bool = true
    @State private var isMainAppViewShown: Bool = false
    
    @EnvironmentObject var singUpGoogle: GoogleAuthentificationViewModel
    
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
                .padding(.top, 10)
            VStack {
                if enterOrRegister {
                    EnterOnVIew
                    EnterButtonView
                        .padding(.vertical, 30)
                }
                else {
                    RegisterOnView
                    EnterButtonView
                        .padding(.vertical, 30)
                }
            }
        }
        .alert(alllertMessage, isPresented: $isShowAllert, actions: {
            Button { } label: {
                Text("OK")
            }
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color.white)
    }
    
    var EnterOnVIew: some View {
        VStack{
            GoogleView
            LoginView
            PasswordView
        }
    }
    var RegisterOnView: some View {
        VStack{
            GoogleView
            LoginView
            PasswordView
            SecondPasswordFillVIew
        }
    }
    var GoogleView: some View {
        Button(action: {
            singUpGoogle.signUpWithGoogle() { result in
                switch result {
                case .success(let user):
                    AuthViewModel.shared.user = user.displayName ?? "Yolo Yoda"
                    isMainAppViewShown.toggle()
                case .failure(let error):
                    alllertMessage = "Ошибка авторизации: \(error.localizedDescription)"
                    isShowAllert.toggle()
                }
            }
        }, label: {
            HStack {
                Image("GooglePhoto")
                    .frame(width: 24, height: 24)
                    .cornerRadius(12)
                Text("Продолжить с Google")
                    .font(.custom("FuturaPT-Book",size: 13))
                    .foregroundColor(Color.black)
            }
            .frame(width: 281, height: 53)
            .background(Color("Gray245"))
            .cornerRadius(5)
        })
            .padding(.vertical, 5)
    }
    var LoginView: some View {
        VStack{
            HStack{
                Image(systemName: "person")
                    .foregroundColor(Color("Violent"))
                    .frame(width: 13.5, height: 13.5)
                TextField("Введите ваш e-mail", text: $login)
                    .font(.custom("FuturaPT-Book",size: 13))
                    .foregroundColor(login.isEmpty ? Color("Gray") : Color.black)
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
    var PasswordView: some View {
        VStack{
            HStack{
                Image(systemName: "key")
                    .foregroundColor(Color("Violent"))
                    .frame(width: 13.5, height: 13.5)
                ZStack {
                    Group {
                        if showPassword {
                            SecureField("Пароль", text: $password)
                        } else {
                            TextField("Пароль", text: $password)
                        }
                    }
                }
                .font(.custom("FuturaPT-Book",size: 13))
                .foregroundColor(password.isEmpty ? Color("Gray") : Color.black)
                .padding(.horizontal, 6)
                Spacer()
                Button(action: {
                    showPassword.toggle()
                }, label: {
                    Image(systemName: "eye")
                        .foregroundColor(Color("Gray213"))
                        .frame(width: 13.5, height: 13.5)
                })
            }
            Label("", image: "")
                .frame(width: 280, height: 2)
                .background(Color("Gray224"))
        }.frame(width: 280, height: 40)
    }
    var SecondPasswordFillVIew: some View {
        VStack{
            HStack{
                Image(systemName: "key")
                    .foregroundColor(Color("Violent"))
                    .frame(width: 13.5, height: 13.5)
                ZStack {
                    Group {
                        if showSecondPassword {
                            SecureField("Повторите ваш пароль", text: $confirmPassword)
                        } else {
                            TextField("Повторите ваш пароль", text: $confirmPassword)
                        }
                    }
                }
                .font(.custom("FuturaPT-Book",size: 13))
                .foregroundColor(confirmPassword.isEmpty ? Color("Gray") : Color.black)
                .padding(.horizontal, 6)
                Spacer()
                Button(action: {
                    showSecondPassword.toggle()
                }, label: {
                    Image(systemName: "eye")
                        .foregroundColor(Color("Gray213"))
                        .frame(width: 13.5, height: 13.5)
                })
            }
            
            Label("", image: "")
                .frame(width: 280, height: 2)
                .background(Color("Gray224"))
        }.frame(width: 280, height: 40)
    }
    var EnterButtonView: some View {
        VStack {
            Button(action: {
                if enterOrRegister {
                    AuthService.shared.signIn(email: self.login,
                                              password: self.password) { result in
                        switch result {
                        case .success(let user):
                            AuthViewModel.shared.user = user.email ?? "Yolo Yoda"
                            isMainAppViewShown.toggle()
                        case .failure(let error):
                            alllertMessage = "Ошибка авторизации: \(error.localizedDescription)"
                            isShowAllert.toggle()
                        }
                    }
                } else {
                    guard password == confirmPassword else {
                        self.alllertMessage = "Пароли не совпадают"
                        self.isShowAllert.toggle()
                        return
                    }
                    AuthService.shared.signUp(email: self.login,
                                              password: self.password) { result in
                        switch result {
                        case .success(_):
                            alllertMessage = "Вы успешно зарегестрировались"
                            self.isShowAllert.toggle()
                        case .failure(let error):
                            alllertMessage = "Ошибка регистрации: \(error.localizedDescription)"
                            self.isShowAllert.toggle()
                        }
                    }
                }
            }, label: {
                Text(enterOrRegister ? "Войти" : "Регистрация")
                    .font(.custom("FuturaPT-Book",size: 18))
                    .foregroundColor(Color.white)
            })
                .frame(width: 281, height: 45)
                .background(Color("Violent"))
                .cornerRadius(36)
                .padding(.vertical, 0)
            if enterOrRegister {
                Button(action: {
                    AuthService.shared.resetPassword(email: self.login) { (result) in
                        switch result {
                        case .failure(let error):
                            self.missPasswordEmail = error.localizedDescription
                        case .success(_ ):
                            break
                        }
                        alllertMessage = missPasswordEmail ?? "Успешно. Пароль выслан на email!"
                        isShowAllert.toggle()
                    }
                }, label: {
                    Text("Забыли пароль?")
                        .font(.custom("FuturaPT-Book",size: 13))
                        .foregroundColor(Color("Gray"))
                })
                    .padding(.vertical, 2)
            }
        }.fullScreenCover(isPresented: $isMainAppViewShown) {
            MainView()
        }
    }
 
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

