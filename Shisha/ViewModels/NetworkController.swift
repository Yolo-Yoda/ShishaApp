import Foundation

struct NetworkController {
    
    static func fetchHookahns(completion: @escaping (([Hookahn.HookahnData]) -> Void)) {
        if let url = URL(string: "https://shisha.crocobusiness.com/api/v1/tobaccos") {
            
            var apiRequest = URLRequest(url: url)
            apiRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            apiRequest.addValue("Bearer 1|T7hwa5y9yq7zrZ9mqdpjaSnY0dbeIAlccI6PfXWc", forHTTPHeaderField: "Authorization")
            apiRequest.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: apiRequest) { data, response, error in
                if let data = data {
                    let hoohkan = try? JSONDecoder().decode(Hookahn.self, from: data)
                    completion(hoohkan?.data ?? [])
                }
            }.resume()
        }
    }
    
    static func fetchTabacos(completion: @escaping (([Tabaco.TabacoData]) -> Void)) {
        if let url = URL(string: "https://shisha.crocobusiness.com/api/v1/tobaccos") {
            
            var apiRequest = URLRequest(url: url)
            apiRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            apiRequest.addValue("Bearer 1|T7hwa5y9yq7zrZ9mqdpjaSnY0dbeIAlccI6PfXWc", forHTTPHeaderField: "Authorization")
            apiRequest.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: apiRequest) { data, response, error in
                if let data = data {
                    let tabaco = try? JSONDecoder().decode(Tabaco.self, from: data)
                    completion(tabaco?.data ?? [])
                }
            }.resume()
        }
    }
}
