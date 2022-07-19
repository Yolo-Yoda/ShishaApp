import Foundation


struct TabItem: Identifiable {
    var id = UUID()
    var icon: String
    var tapped: Tab
}

var tabItems = [
    TabItem(icon: "shadow", tapped: .hoohkan),
    TabItem(icon: "leaf", tapped: .tabaco),
    TabItem(icon: "book", tapped: .miks),
    TabItem(icon: "person", tapped: .user)
]

enum Tab: String {
    case hoohkan
    case tabaco
    case miks
    case user
}
