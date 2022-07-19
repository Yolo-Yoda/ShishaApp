import SwiftUI

struct MiksView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color("Violent"))]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.init(Color("Violent"))]
    }

    let layout = [GridItem(.adaptive(minimum: screen.width / 2.2, maximum: screen.height))]
    let searchLaout = [GridItem(.adaptive(minimum: screen.width / 3.5, maximum: screen.height))]
    
    @State var isSearching = false
    @State var countHGrid: Int = 0
    @State private var searchQuery: String = ""
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                SearchBar(searchQuery: $searchQuery, isSearching: $isSearching)
                Section() {
                    LazyVGrid(columns: layout,spacing: 20) {
                        ForEach(MiksViewModel.shared.mikses.filter({ "\($0)".contains(searchQuery) || searchQuery.isEmpty}), id: \.id) { miks in
                            NavigationLink {
                                MiksDetailView(miks: miks)
                            } label: {
                                MiksCell(miks: miks)
                            }
                            
                        }
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 10)
                .padding(.bottom, 100)
            }
            .navigationTitle("Смеси").foregroundColor(Color("Violent"))
            .background(.ultraThinMaterial)
            .background(Image("BackgroungHookahn")
                        .aspectRatio(contentMode: .fit))
        }
    }
}

struct MiksView_Previews: PreviewProvider {
    static var previews: some View {
        MiksView()
    }
}
