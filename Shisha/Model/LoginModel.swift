import Foundation

struct LoginModel: Identifiable {
    var id = UUID()
    var login: String
    var password: String
    var ownTabacos: [CartTabaco]
}
