import Foundation
import Combine
import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject{
    
    static let shared = AuthViewModel()
    
    public init() { }
    
    @Published var authItems: LoginModel = LoginModel(login: "", password: "", ownTabacos: [])
    @Published var ownTabacos = [CartTabaco]()
    @Published var user: String = "Yolo Yoda"
    
    func fillLogin(_ login: String) {
        authItems.login = login
    }
    
    func appendTabaco(_ tabaco: CartTabaco) {
        if ownTabacos.contains(tabaco){
            print("CONTAINT")
        } else {
            self.ownTabacos.append(tabaco)
        }
    }
}
struct CartTabaco: Hashable {
    //var id = UUID()
    var tabaco: Tabaco.TabacoData
}
