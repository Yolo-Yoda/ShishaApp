import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn

let screen = UIScreen.main.bounds

@main
struct ShishaApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(GoogleAuthentificationViewModel())
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()

            return true
        }
        func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            
            return GIDSignIn.sharedInstance.handle(url)
        }
    }
    
}
