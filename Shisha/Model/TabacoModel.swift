import Foundation

struct Tabaco: Decodable {
    var data: [TabacoData]
    var links: Links?
    var meta: Meta?
    
    struct TabacoData: Decodable, Hashable, Identifiable {
        var id: Int?
        var active: Bool
        var name, body: String?
        var bodyShort: String?
    }
    
    struct Links: Decodable {
        var first, last: String?
        var prev: String?
        var next: String?
    }
    
    struct Meta: Decodable {
        var currentPage, from, lastPage: Int?
        var links: [Link]?
        var path: String?
        var perPage, to, total: Int?
        
        struct Link: Decodable {
            var url: String?
            var label: String?
            var active: Bool?
        }
    }
}
