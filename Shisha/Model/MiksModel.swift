import Foundation

struct MiksData: Hashable{
    var id: Int
    var active: Bool
    var name: String
    var bodyShort: String
    var imageURL: String
    var count: String
    var comprises: [Tabaco.TabacoData]
}
