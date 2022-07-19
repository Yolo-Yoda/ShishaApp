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
    @State var isSearching = false
    @State var countHGrid: Int = 0
    
    @ObservedObject var hookhanViewModel = HoohkahnViewModel()
    
    var body: some View {
        
        VStack {
            if !hookhanViewModel.hoohkahs.isEmpty {
                ScrollView(.vertical, showsIndicators: true) {
                    SearchBar(searchQuery: $searchQuery, isSearching: $isSearching)
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
                            ForEach(hookhanViewModel.hoohkahs.filter({ "\($0)".contains(searchQuery) || searchQuery.isEmpty}), id: \.self) { hoohan in
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
                    .padding(.bottom, 100)
                }
                .navigationBarHidden(false)
                .navigationTitle("Кальяны").foregroundColor(Color("Violent"))
            } else {
                SpinnerView()
                    .onAppear {
                        self.hookhanViewModel.fetchHookans()
                    }
            }
        }
        .background(.ultraThinMaterial)
        .background(Image("BackgroungHookahn")
                        .aspectRatio(contentMode: .fit))
        
    }
}

struct HoohkahnView_Previews: PreviewProvider {
    static var previews: some View {
        
        HoohkahnView()
        
    }
}

struct SearchBar: View {
    
    @Binding var searchQuery: String
    @Binding var isSearching: Bool
    var body: some View {
        HStack {
            HStack {
                TextField("Search hoohkahn...", text: $searchQuery)
                    .padding(.leading, 24)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(20)
            .padding(.horizontal)
            .onTapGesture {
                isSearching = true
            }
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    if isSearching {
                        Button {
                            searchQuery = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        }
                    }
                }
                .padding(.horizontal, 32)
                .foregroundColor(Color.gray)
            )
            if isSearching {
                Button {
                    isSearching = false
                    searchQuery = ""
                    UIApplication.shared.sendAction(
                        #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                } label: {
                    Text("Cancel")
                        .foregroundColor(.white)
                    
                        .padding(.trailing)
                        .padding(.leading, -12)
                }
            }
        }
    }
}
