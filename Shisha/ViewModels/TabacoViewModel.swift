import Foundation

class TabacoViewModel: ObservableObject {
    
    @Published var isRequestFailed = true
    @Published var tabacos: [Tabaco.TabacoData] = []
    @Published var popularTabacos: [Tabaco.TabacoData] = []
    
    func fetchTabacos() {
        NetworkController.fetchTabacos { tabacos in
            DispatchQueue.main.async {
                self.tabacos = tabacos
                self.popularTabacos.append(self.tabacos.randomElement() ?? Tabaco.TabacoData(id: 1, active: true, name: "1", body: "1", bodyShort: "2"))
                self.popularTabacos.append(self.tabacos.randomElement() ?? Tabaco.TabacoData(id: 1, active: true, name: "1", body: "1", bodyShort: "2"))
                self.popularTabacos.append(self.tabacos.randomElement() ?? Tabaco.TabacoData(id: 1, active: true, name: "1", body: "1", bodyShort: "2"))
                self.isRequestFailed = false
            }
        }
    }
}

