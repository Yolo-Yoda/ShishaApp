import Foundation
import UIKit
import Combine

class HoohkahnViewModel: ObservableObject {
    
    @Published var isRequestFetching = false
    @Published var hoohkahs: [Hookahn.HookahnData] = []
    @Published var popularHoohkahs: [Hookahn.HookahnData] = []
    
    func fetchHookans() {
        NetworkController.fetchHookahns { hoohkahs in
            DispatchQueue.main.async {
                self.hoohkahs = hoohkahs
                self.popularHoohkahs.append(self.hoohkahs.randomElement() ?? Hookahn.HookahnData(id: 1, active: true, name: "1", imageURL: "1", body: "1", bodyShort: "2"))
                self.popularHoohkahs.append(self.hoohkahs.randomElement() ?? Hookahn.HookahnData(id: 1, active: true, name: "1", imageURL: "1", body: "1", bodyShort: "2"))
                self.popularHoohkahs.append(self.hoohkahs.randomElement() ?? Hookahn.HookahnData(id: 1, active: true, name: "1", imageURL: "1", body: "1", bodyShort: "2"))
                self.isRequestFetching = true
            }
        }
    }
}
