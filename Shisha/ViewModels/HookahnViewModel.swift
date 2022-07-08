//
//  HookahnViewModel.swift
//  Shisha
//
//  Created by Виктор Васильков on 8.07.22.
//

import Foundation

class HoohkahnViewModel: ObservableObject {
    
    @Published var hoohkahs: [Hookahn.HookahnData] = []
    @Published var popularHoohkahs: [Hookahn.HookahnData] = []
    
    func fetchHookans() {
        NetworkController.fetchHookahns { hoohkahs in
            DispatchQueue.main.async {
                self.hoohkahs = hoohkahs
                self.popularHoohkahs.append(hoohkahs.randomElement() ?? Hookahn.HookahnData(id: 1, active: true, name: "1", imageURL: "2", body: "3", bodyShort: "4"))
            }
            
        }
    }

}
