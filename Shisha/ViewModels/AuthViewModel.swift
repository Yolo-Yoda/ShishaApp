import Foundation
import Combine
import SwiftUI

final class AuthViewModel: ObservableObject{
    
    static let shared = AuthViewModel()
    
    public init() { }
    
    @Published var authItems: LoginModel = LoginModel(login: "", password: "")
    
    @Published var login: String = ""
    @Published var password: String = ""
    
    func fillLogin(_ login: String) {
        authItems.login = login
    }
    
}
