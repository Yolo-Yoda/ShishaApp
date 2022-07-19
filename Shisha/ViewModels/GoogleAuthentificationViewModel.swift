import Foundation
import FirebaseAuth
import Firebase
import GoogleSignIn
import SwiftUI


class GoogleAuthentificationViewModel: ObservableObject {
    
    @Published var isLogin: Bool = false
    
    func signUpWithGoogle(completion: @escaping (Result<User, Error>) -> ()) {
        
        guard let clientId = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientId)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: ApplicationUtility.rootViewController) {
            [self] user, error in
        
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let authentification = user?.authentication else { return }
            guard let idToken = authentification.idToken else { return }
            
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentification.accessToken)
           
            Auth.auth().signIn(with: credential) { result, error in
                if let result = result {
                    completion(.success(result.user))
                    isLogin.toggle()
                } else if let error = error {
                    completion(.failure(error))
                }
            }
        }
    }
    
}

final class ApplicationUtility {
    static var rootViewController: UIViewController {
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }
}

