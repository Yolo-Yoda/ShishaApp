import SwiftUI

struct TabacoView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color("Violent"))]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.init(Color("Violent"))]
    }
    
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.2, maximum: screen.height))]
    let layoutHorizontal = [GridItem(.adaptive(minimum: screen.width / 1.2, maximum: screen.width * 5))]
    let searchLayout = [GridItem(.adaptive(minimum: screen.width / 3.5, maximum: screen.height))]
    
    @State private var searchQuery: String = ""
    @State var isSearching = false
    @State var countHGrid: Int = 0
    
    @ObservedObject var tabacoViewModel = TabacoViewModel()
    
    var body: some View {
        
        VStack {
            if !tabacoViewModel.tabacos.isEmpty {
                ScrollView(.vertical, showsIndicators: true) {
                    SearchBar(searchQuery: $searchQuery, isSearching: $isSearching)
                    Section() {
                        ScrollView(.horizontal, showsIndicators: true) {
                            LazyHGrid(rows: layoutHorizontal) {
                                ForEach(tabacoViewModel.popularTabacos, id: \.id) { tabaco1 in
                                    NavigationLink {
                                        TabacoDetailView(tabaco: tabaco1)
                                        
                                    } label: {
                                        TabacoCellWidthed(tabaco: tabaco1)
                                    }
                                    
                                }
                                
                            }
                                
                        }
                    }.frame(height: 120)
                    
                    Section() {
                        LazyVGrid(columns: layout,spacing: 20) {
                            ForEach(tabacoViewModel.tabacos.filter({ "\($0)".contains(searchQuery) || searchQuery.isEmpty}), id: \.self) { tabaco in
                                NavigationLink {
                                    TabacoDetailView(tabaco: tabaco)
                                    
                                } label: {
                                    TabacoCell(tabaco: tabaco)
                                }
                                
                                
                            }
                        }
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 100)
                }
                
                .navigationBarHidden(false)
            .navigationTitle("Табаки").foregroundColor(Color("Violent"))
            } else {
                SpinnerView()
                    .onAppear {
                        self.tabacoViewModel.fetchTabacos()
                    }
            }
        }
        .background(.ultraThinMaterial)
        .background(Image("BackgroungHookahn")
                        .aspectRatio(contentMode: .fit))
        
    }
}

struct TabacoView_Previews: PreviewProvider {
    static var previews: some View {
        TabacoView()
    }
}
