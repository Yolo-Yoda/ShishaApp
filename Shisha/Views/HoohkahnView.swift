//
//  HoohkahnView.swift
//  Shisha
//
//  Created by Виктор Васильков on 8.07.22.
//

import SwiftUI

struct HoohkahnView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color("Violent"))]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.init(Color("Violent"))]
    }
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.2, maximum: screen.height))]
    
    let layoutHorizontal = [GridItem(.adaptive(minimum: screen.width / 1.2, maximum: screen.width * 5))]
    
    let searchLayout = [GridItem(.adaptive(minimum: screen.width / 3.5, maximum: screen.height))]
    @State private var searchQuery: String = ""
    
    @State var countHGrid: Int = 0
    
    @ObservedObject var hookhanViewModel = HoohkahnViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            Section {
                ScrollView(.horizontal, showsIndicators: true) {
                    LazyHGrid(rows: layoutHorizontal) {
                        ForEach(hookhanViewModel.popularHoohkahs, id: \.id) { hoohan1 in
                            NavigationLink {
                                HookanDetailView(hoohkan: hoohan1)
                            } label: {
                                HookanCellWidthed(hoohkan: hoohan1)
                            }
                        }
                    }
                }
            }.frame(height: 120)
            
            Section() {
                LazyVGrid(columns: layout,spacing: 20) {
                    ForEach(hookhanViewModel.hoohkahs, id: \.self) { hoohan in
                        NavigationLink {
                            HookanDetailView(hoohkan: hoohan)
                            
                        } label: {
                            HookanCell(hoohkan: hoohan)
                        }
                        
                        
                    }
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 10)
        }
        .onAppear {
            self.hookhanViewModel .fetchHookans()
        }
        .navigationBarHidden(false)
        .navigationTitle("Кальяны").foregroundColor(Color("Violent"))
    }
}

struct HoohkahnView_Previews: PreviewProvider {
    static var previews: some View {
        HoohkahnView()
    }
}
